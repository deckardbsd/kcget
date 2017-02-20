import sys, vim, requests, json
from utils import services


TIMEOUT = 3
ktype = sys.argv[-1][0]
namespace = sys.argv[-1][1]
URL = "http://kd.syncrasy.io/api/v1/{0}/{1}".format(ktype, namespace)

# service class
# name, port, namespace
try:
    r = requests.get(URL, timeout=TIMEOUT)
    jr = json.loads(r.text)
    # vim.current.buffer.append("{}".format(80 * "-"))

    my_service = services.Services("pppp", "doidoi")
    my_service.get_name()

    vim.current.buffer.append("Services: {}".format(jr.get("listMeta").get("totalItems")))
    vim.current.buffer.append("============")


    for item in jr.get("services"):
        om_name = item.get('objectMeta').get('name')
        c_time  = item.get('objectMeta').get('creationTimestamp')
        hostn = item.get('internalEndpoint').get('host')
        htype = item.get('type')
        ports = item.get('internalEndpoint').get('ports')
        c_ip  = item.get('clusterIP')

        vim.current.buffer.append("name: {}".format(om_name))
        vim.current.buffer.append("creation ts: {}".format(c_time))
        vim.current.buffer.append("hostname: {}".format(hostn))
        vim.current.buffer.append("service type: {}".format(htype))
        vim.current.buffer.append("ports: ")
        for p in ports:
            vim.current.buffer.append("{} {}".format(" " * 4, json.dumps(p)))
        vim.current.buffer.append("cluster IP: {}".format(c_ip))
        vim.current.buffer.append("---------")

except Exception, e:
    print(e)

