cp ../northwind.sql .
cp ../create_db.sh .
docker build -t northwind_image .
docker run --name northwind_container -d northwind_image
