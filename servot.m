y=serial('COM3','BAUD', 9600);

fopen(y);
go = true;

while go
                 
a= input('Press 1 to turn ON LED & 0 to turn OFF:');
fprintf(y,a);  

if (a == 2)
  go=false;
end  
end