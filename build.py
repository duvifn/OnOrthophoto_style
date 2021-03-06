import os
from os import path
import argparse


parser = argparse.ArgumentParser(description='Takes a mapnik xml file and replaces paths and configs')
parser.add_argument('-i' ,'--input_file', metavar='INPUT_FILE', type=str,
                    help='a path to input mapnik.xml file', required=True)
parser.add_argument('-m' ,'--input_project_file', metavar='INPUT_FILE', type=str,
                    help='a path to input project mml  file')
parser.add_argument('-d', '--db_name', metavar='DB_NAME', type=str,
                    help='db name for osm data', required=True)
parser.add_argument('-u', '--user_name', metavar='USER_NAME', type=str, required=True,
                    help='user name')
parser.add_argument('-p' ,'--password', metavar='PASSWORD', type=str, required=True,
                    help='password')
parser.add_argument('-s', '--host', metavar='HOST', type=str, required=True,
                    help='''host for thh postgis db.
                            On this host should be 3 databases:
                            Osm data (the name for this db is configurable)
                            contours
                            contours_20
                            All the 3 databases should have a scheme of osm2pgsql rendering db
                    ''') 
parser.add_argument('-l' ,'--language', metavar='LANGUAGE', type=str, default='en',
                    help='A prefered language code in which to title places')                  
args = parser.parse_args()

# python replace_mapnik_style.py -i mapnik.xml -d fake_dbname -u fake_user_name -p fake_password -s fake_host -e /fake_path/to/external/layers -k /media/duvi/Extreme/temp/openstreetmap-carto/data/simplified-land-polygons-complete-3857/simplified_land_polygons.shp -b /media/duvi/Extreme/temp/openstreetmap-carto/data/land-polygons-split-3857/land_polygons.shp
input_file=open(args.input_file).read()
input_file = input_file.replace('<Parameter name="dbname"><![CDATA[fake_db_name]]></Parameter>','<Parameter name="dbname"><![CDATA[' + args.db_name +']]></Parameter>')
input_file = input_file.replace('<Parameter name="user"><![CDATA[fake_user_name]]></Parameter>', '<Parameter name="user"><![CDATA[' +  args.user_name + ']]></Parameter>')
input_file = input_file.replace('<Parameter name="password"><![CDATA[fake_password]]></Parameter>', '<Parameter name="password"><![CDATA[' + args.password + ']]></Parameter>')
input_file = input_file.replace('<Parameter name="host"><![CDATA[fake_host]]></Parameter>', '<Parameter name="host"><![CDATA[' + args.host + ']]></Parameter>')
input_file = input_file.replace('tags -> \'name:en\'', 'tags -> \'name:' + args.language  + '\'')

       

with open(args.input_file, 'w') as of:
    of.write(input_file)

if args.input_project_file:
    input_file=open(args.input_project_file).read()
    input_file.replace('"dbname": "fake_db_name"','"dbname": "' + args.db_name +'"')
    input_file = input_file.replace('"user": "fake_user_name"', '"user": "' +  args.user_name + '"')
    input_file = input_file.replace('"password": "fake_password"', '"password": "' + args.password + '"')
    input_file = input_file.replace('"host": "fake_host"', '"host": "' + args.host + '"')
    input_file = input_file.replace('tags -> \'name:en\'', 'tags -> \'name:' + args.language  + '\'')
    
    with open(args.input_project_file, 'w') as of:
        of.write(input_file)


