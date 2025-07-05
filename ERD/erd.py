import xml.etree.ElementTree as ET
from graphviz import Digraph

# Function to generate airbnb_erd.drawio (XML format)
def generate_drawio_file():
    # Create the root element for Draw.io XML structure
    mxfile = ET.Element('mxfile', host='app.diagrams.net')
    diagram = ET.SubElement(mxfile, 'diagram', id='diagram_1', name='Page-1')
    mxGraphModel = ET.SubElement(diagram, 'mxGraphModel')
    root = ET.SubElement(mxGraphModel, 'root')

    # Add default cells required by Draw.io
    ET.SubElement(root, 'mxCell', id='0')
    ET.SubElement(root, 'mxCell', id='1', parent='0')

    # Helper function to add an entity
    def add_entity(cell_id, value, x, y):
        cell_attrib = {
            'id': str(cell_id),
            'value': value,
            'style': 'shape=rectangle',
            'parent': '1',
            'vertex': '1'
        }
        cell = ET.SubElement(root, 'mxCell', attrib=cell_attrib)
        geometry_attrib = {
            'x': str(x),
            'y': str(y),
            'width': '100',
            'height': '50',
            'as': 'geometry'  # Use attrib dict to avoid Python keyword conflict
        }
        ET.SubElement(cell, 'mxGeometry', attrib=geometry_attrib)

    # Helper function to add a relationship
    def add_relationship(cell_id, source, target, label):
        cell_attrib = {
            'id': str(cell_id),
            'value': label,
            'style': 'edgeStyle=orthogonalEdgeStyle',
            'parent': '1',
            'source': str(source),
            'target': str(target),
            'edge': '1'
        }
        cell = ET.SubElement(root, 'mxCell', attrib=cell_attrib)
        geometry_attrib = {
            'relative': '1',
            'as': 'geometry'  # Use attrib dict to avoid Python keyword conflict
        }
        ET.SubElement(cell, 'mxGeometry', attrib=geometry_attrib)

    # Add entities with their positions
    add_entity(2, 'Users', 100, 100)
    add_entity(3, 'Properties', 300, 100)
    add_entity(4, 'Bookings', 100, 300)
    add_entity(5, 'Reviews', 300, 300)
    add_entity(6, 'Payments', 500, 300)

    # Add relationships with labels
    add_relationship(7, 2, 3, 'owns')
    add_relationship(8, 2, 4, 'makes')
    add_relationship(9, 3, 4, 'has')
    add_relationship(10, 3, 5, 'has')
    add_relationship(11, 2, 5, 'leaves')
    add_relationship(12, 4, 6, 'has')

    # Write the XML structure to a .drawio file
    tree = ET.ElementTree(mxfile)
    tree.write('airbnb_erd.drawio')

# Function to generate airbnb_erd.png using graphviz
def generate_png_file():
    # Initialize a directed graph
    dot = Digraph(comment='Airbnb ER Diagram')

    # Define entities with attributes
    dot.node('Users', 'Users\nid\nusername\nemail\npassword\nrole')
    dot.node('Properties', 'Properties\nid\nowner_id\ntitle\ndescription\nlocation\nprice')
    dot.node('Bookings', 'Bookings\nid\nproperty_id\nuser_id\ncheck_in_date\ncheck_out_date')
    dot.node('Reviews', 'Reviews\nid\nproperty_id\nuser_id\nrating\ncomment')
    dot.node('Payments', 'Payments\nid\nbooking_id\namount\npayment_date')

    # Define relationships between entities
    dot.edge('Users', 'Properties', label='owns')
    dot.edge('Users', 'Bookings', label='makes')
    dot.edge('Properties', 'Bookings', label='has')
    dot.edge('Properties', 'Reviews', label='has')
    dot.edge('Users', 'Reviews', label='leaves')
    dot.edge('Bookings', 'Payments', label='has')

    # Render the diagram as a PNG file
    dot.render('airbnb_erd', format='png')

# Execute both functions to generate the files
generate_drawio_file()
generate_png_file()