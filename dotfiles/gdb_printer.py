import gdb.printing

class MapPrinter:
    "Print a std::map<std::string, std::list<std::string>>"

    def __init__(self, val):
        self.val = val

    def to_string(self):
        children = self.val['map_']['_M_t']['_M_impl']['_M_t']['_M_head_impl']
        items = []
        while children != 0:
            key = children['value']['first']
            value = children['value']['second']
            items.append((str(key), value))
            children = children['next']
        return '{' + ', '.join('{}: {}'.format(k, v) for k, v in items) + '}'

class ListPrinter:
    "Print a std::list<std::string>"

    def __init__(self, val):
        self.val = val

    def to_string(self):
        begin = self.val['list_']['_M_impl']['_M_node']['_M_next']
        end = self.val['list_']['_M_impl']['_M_node']
        items = []
        while begin != end:
            items.append(str(begin['value']))
            begin = begin['_M_next']
        return '[' + ', '.join(items) + ']'

def build_pretty_printer():
    pp = gdb.printing.RegexpCollectionPrettyPrinter("my_printers")
    pp.add_printer('map', '^std::map<std::string, std::list<std::string> >$', MapPrinter)
    pp.add_printer('list', '^std::list<std::string>$', ListPrinter)
    return pp

gdb.printing.register_pretty_printer(gdb.current_objfile(), build_pretty_printer())
