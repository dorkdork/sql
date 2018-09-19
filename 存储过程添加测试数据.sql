-- 如果存在就删除这个存储过程.
drop procedure if exists copy_task_proc;

-- 创建存储过程，将指定SQ执行totalCount次
create procedure copy_task_proc(IN totalCount int)
  begin
    declare i int;
    declare t datetime;
    set i = 0;
    set t = now();
    while i < totalCount do
      set t = date_add(t, interval 1 second);
      -- 要执行的SQL语句
      -- 复制当前表的数据，插入到当前表
      insert into m_distributor (client_name, client_num, address, tax_num, update_time)
      values (concat("tom", i), 200 + i, concat("address", i), concat("tax_num", i), t);
      set i = i + 1;

    end while;
  end;
-- 调用存储过程
call copy_task_proc(1000);