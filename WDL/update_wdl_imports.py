#!/usr/bin/env python3

import sys, os, re
import glob
import logging

logging.basicConfig(level=logging.INFO, 
                    format='%(asctime)s : %(levelname)s : %(message)s',
                    datefmt='%H:%M:%S')
logger = logging.getLogger(__name__)

usage = "\n\n\tusage: {} commit_id\n\n\n".format(sys.argv[0])

if len(sys.argv) < 2:
    exit(usage)

commit_id = sys.argv[1]

template_wdls = glob.glob("*.TEMPLATE.wdl")
for template_wdl in template_wdls:
    deployment_wdl = template_wdl.replace(".TEMPLATE.wdl", ".wdl")

    with open(template_wdl) as fh:
        input = "\n".join(fh.readlines())
        input = re.sub("__COMMIT_ID__", commit_id, input)
        with open(deployment_wdl, 'wt') as ofh:
            print(input, file=ofh)
        logger.info("-converted {} to {}".format(template_wdl, deployment_wdl))


logger.info("done")

sys.exit(0)


        