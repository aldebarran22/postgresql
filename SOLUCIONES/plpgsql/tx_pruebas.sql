-- TX;

do $$
declare
	
	
begin

begin;
execute 'drop table public.tbpedidoshistorico1996';
execute 'drop table public.tbpedidoshistorico1997';

commit;
raise  info 'commit ok';

exception when others then
	raise info 'rollback';
	rollback;

end $$