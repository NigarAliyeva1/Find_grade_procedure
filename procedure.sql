
create or replace procedure find_grade (p_score varchar2) is
v_grade varchar2(10);
e_above_hundred exception;
e_below_zero exception;
v_result_value number;
begin

    v_result_value:=to_number(p_score);
    
    if p_score>100 then
    raise e_above_hundred;
    elsif p_score<0 then
    raise e_below_zero;
    end if;
    
    if p_score>90 then
    v_grade:='A';
    elsif p_score>80 then
    v_grade:='B';
    elsif p_score>70 then
    v_grade:='C';
    elsif p_score>60 then
    v_grade:='D';
    elsif p_score>50 then
    v_grade:='E';
    else v_grade:='F';
    end if;
    print(v_grade);

exception 
    when value_error then
    dbms_output.put_line('Error: Invalid number format');
    when e_above_hundred then
    dbms_output.put_line('Error: Value cannot be above 100');
    when e_below_zero then
    dbms_output.put_line('Error: Value cannot be below zero');
    when others then 
    dbms_output.put_line('Oops, Error!'); 
end;
