import docker

# INSERT INTO committees VALUES ('General', 'General') ON CONFLICT DO NOTHING;
BASE_SQL = """
INSERT INTO officers( title, email, \"primaryOfficer\", \"committeeName\", \"userDce\", \"startDate\", \"endDate\")
    VALUES (\\'President\\', \\'president@sse.rit.edu\\', TRUE, \\'General\\', \\'mpt2360\\', now(), \\'2020-1-1\\');
"""

def main():
    """ Main """
    client = docker.from_env()
    for service in client.services.list(filters={'name': 'sse_postgres'}):
        for t in service.tasks():
            if t['Status']['State'] == 'running':
                container_id = t['Status']['ContainerStatus']['ContainerID']

        container = client.containers.get(container_id)
        command = 'psql -U postgres -c \'\'\'' + BASE_SQL + '\'\'\''
        print(command)
        for output in container.exec_run(command, stream=True):
            print(output)



if __name__ == "__main__":
    main()
