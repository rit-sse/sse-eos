#!/bin/bash

./$@ build gateway
./$@ kill gateway
./$@ rm gateway
./$@ up -d
