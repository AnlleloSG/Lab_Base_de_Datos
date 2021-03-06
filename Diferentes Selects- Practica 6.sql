Use CentralAutobus


Select (vNombre_Cliente + '		'+ vDomicilio_Cliente + '		'+ vEstado_Cliente) as 'Datos del Cliente', iEdad_Cliente + 2 as Edad, SUBSTRING(vNombre_Cliente,0,3) as 'Alias del Cliente' from Cliente as e
Select (vNombre_Chofer + '		'+ vApellidoP_Chofer + '		'+ vApellidoM_Chofer) as 'Datos del Chofer', iId_Chofer + 1 as 'Chofers Salidos', SUBSTRING(vNombre_Chofer,0,3) as 'Alias del Chofer' from Chofer as ch
Select TOP 3 (iId_Venta + '		'+ iId_Caja + '		'+ iId_Boleto) as 'Datos de la Venta', SUBSTRING(vNombre_Cliente,0,3) as 'Alias del Cliente' from Venta as v
Select TOP 8 (vNombre_Sucursal + '		'+ vDomicilio_Sucursal + '		'+ vCiudad_Sucursal) as 'Datos de la Sucursal',  SUBSTRING(vNombre_Sucursal,0,3) as 'Alias de la Scurusal' from Sucursal as	suc 
Select (vMarca_Autobus + '		'+ vModelo_Autobus) as 'Datos del Autobus',  SUBSTRING(vMarca_Autobus,0,3) as 'Alias del Autobus' from Autobus as	aut

Select iId_Caja,suc.iId_Sucursal,c.iId_Sucursal,bEstado_Sucursal from Sucursal suc inner join Caja c on suc.iId_Sucursal=c.iId_Sucursal
Select iId_Caja,suc.iId_Sucursal,c.iId_Sucursal,bEstado_Sucursal from Sucursal suc left join Caja c on suc.iId_Sucursal=c.iId_Sucursal
Select iId_Caja,suc.iId_Sucursal,c.iId_Sucursal,bEstado_Sucursal from Sucursal suc right join Caja c on suc.iId_Sucursal=c.iId_Sucursal
Select iId_Caja,suc.iId_Sucursal,bEstado_Sucursal from Sucursal cross Join Sucursal suc, Caja c

Select  iId_Caja,iId_Caja,vCiudad_Sucursal from Caja as c, Sucursal as suc where suc.iId_Sucursal>2
Select c.vNombre_Cliente,iId_Autobus,iNum_Asiento from Boleto as bol, Cliente as c where iId_Autobus<10
Select  iId_Caja,iId_Caja,vCiudad_Sucursal from Caja as c, Sucursal as suc where c.iId_Caja=2
Select c.vNombre_Cliente,iId_Autobus,iNum_Asiento from Boleto as bol, Cliente as c where iId_Autobus!=1
Select c.vNombre_Cliente,iId_Autobus,iNum_Asiento from Boleto as bol, Cliente as c where iId_Autobus=iId_Viaje

Select count(vApellidoP_Chofer) as 'Chofers Appelido Paterno' from Chofer having count(iId_Chofer)>1
Select Min(iId_Chofer) as ' Choferes Minimos' from Chofer
Select Max(iId_Chofer) as  'Choferes Maximos' from Chofer group by vNombre_Chofer
Select AVG(iId_Chofer) 'Media Choferes' from Chofer group by vCiudad_Chofer 
Select SUM(iId_Chofer) 'Suma id Choferes' from Chofer group by vEstado_Chofer 

Select iId_Caja,suc.iId_Sucursal,bEstado_Sucursal, count(suc.iId_Sucursal) as 'Sucursales Disponibles' from Sucursal suc cross Join  Caja c where suc.iId_Sucursal>1 group by suc.iId_Sucursal
Select iId_Caja,suc.iId_Sucursal,bEstado_Sucursal, count(c.iId_Caja) as 'Cajas Disponibles' from Sucursal suc cross Join  Caja c where c.iId_Caja>1 group by c.iId_Caja

select*
into #viaje
from Viaje

drop table Viaje