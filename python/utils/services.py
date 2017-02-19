


class Services(object):
    """ A class which defines a k8s Service """

    def __init__(self, name, namespace="development"):
        """ construct me a Service object, please ! """

        self.__name = name
        self.__ns   = namespace

    def get_name(self):
        """ returns the name of the service """
        return self.__name

    def get_namespace(self):
        """ returns the namespace of the service """
        return self.__ns

