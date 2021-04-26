keyword="student_ages" 
if curl -u toto:python -X GET http://192.168.1.110:5002/pozos/api/v1.0/get_student_ages | grep "$keyword"
then
    exit 0
else
    exit 1
fi