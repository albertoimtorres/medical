from json import load

"""
    Realiza la lectura del archivo Schema JSON
    Para decodificar una cadena en el formato JSON 
    (es decir, convertirla a un objeto de Python), 
    utilizamos loads.
"""
def get_schema(path):
    with open(path) as f:
        schema = load(f)
    return schema