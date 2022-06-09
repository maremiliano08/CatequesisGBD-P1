select catecumeno.id_catecu,catecumeno.apll_catecu,matricula
from matricula
inner join catecumeno on  matricula.id_matricula = catecumeno.id_catecu
where matricula.estado_matricula = 'Cancelada'
order by catecumeno.nom_catecu asc


select 
catecumeno.id_catecu,catecumeno.nom_catecu,catecumeno.apll_catecu,extract (year from catecumeno.fecha_naci_catecu)
representante.nom_representante, representante.apll_representante
from catecumeno
inner join representante on representante.id_representante = catecumeno.id_representante
where extract (year from catecumeno.fecha_naci_catecu) > '2003'
order by catecumeno.fecha_naci_catecu asc 


select representante.id_representante,representante.nom_representante,representante.apll_representante,matricula.id_matricula,catecumeno.nom_catecu
from representante
inner join catecumeno on catecumeno.id_catecu = representante.id_representante
inner join matricula on matricula.id_matricula = representante.id_representante
order by representante.nom_representante asc


select 
extract (month from matricula.fecha_matricula) as mes, matricula.id_matricula, catecumeno.nom_catecu
from matricula
inner join catecumeno on catecumeno.id_catecu = matricula.id_matricula
where extract (month from matricula.fecha_matricula) = 1