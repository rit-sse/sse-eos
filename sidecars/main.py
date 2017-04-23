import docker
from io import StringIO
from subprocess import getoutput

# INSERT INTO committees VALUES ('General', 'General') ON CONFLICT DO NOTHING;
# BASE_SQL = """
# INSERT INTO officers( title, email, \"primaryOfficer\", \"committeeName\", \"userDce\", \"startDate\", \"endDate\")
#     VALUES (\\'President\\', \\'president@sse.rit.edu\\', TRUE, \\'General\\', \\'mpt2360\\', now(), \\'2020-1-1\\');
# """

def getPostgres():
    """ Grabs the current sse_postgres container """
    client = docker.from_env()
    for service in client.services.list(filters={'name': 'sse_postgres'}):
        for t in service.tasks():
            if t['Status']['State'] == 'running':
                container_id = t['Status']['ContainerStatus']['ContainerID']

        container = client.containers.get(container_id)
    return container


def createTarball():
    cmd = "tar -c ./base.sql ./sidecar.sql"
    p = getoutput(cmd)
    return StringIO(p)


def main():
    """ Main """
    postgres = getPostgres()
    print(postgres.name)


    with open('./sidecar.sql', 'w') as sideFile:
        sideFile.write('INSERT INTO officers( title, email, "primaryOfficer", "committeeName", "userDce", "startDate", "endDate")')
        sideFile.write('VALUES (\'President\', \'president@sse.rit.edu\', TRUE, \'General\', \'mpt2360\', now(), \'2020-1-1\');')

    with createTarball() as buf:
        l_client = docker.APIClient(base_url='unix://var/run/docker.sock')
        succ = l_client.put_archive(postgres.name, '/tmp/', buf)
        print(succ)

        for line in postgres.exec_run('psql -U postgres -f /tmp/base.sql', stream=True):
            print(line)

        for line in postgres.exec_run('psql -U postgres -f /tmp/sidecar.sql', stream=True):
            print(line)


if __name__ == "__main__":
    main()
