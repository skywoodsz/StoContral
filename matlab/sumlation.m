 %%分段函数模拟
 %初始化
 v_max=3000;%最大速度
 v_s=0;%初始速度
 v_e=0;%结束速度
 J=289;%加加速度
 a_max=750;%最大加速度
 %计算
 %阶段时间
 tb1=a_max/J;%加加速阶段时间
 tb2=v_max/a_max-tb1;%匀速阶段时间
 tb3=tb1;%减加速阶段时间
 %总时间
 t1=tb1;
 t2=tb1+tb2;
 t3=tb1+tb2+tb3;
 t4=t3+8;
 t5=t4+tb1;
 t6=t5+tb2;
 t7=t6+tb3;
 t=0:0.01:t7;
 %速度函数
 
 v_t1=v_s+1/2*J.*t.^2.*(t<=t1);
 v_t1_max=max(v_t1);
 
 v_t2=v_t1_max+a_max.*(t-t1).*(t>t1&t<=t2);
 v_t2_max=max(v_t2);
 
 v_t3=v_t2_max+a_max.*(t-t2)-1/2*J.*(t-t2).^2.*(t>t2&t<=t3);
 
 v_t4=v_max.*(t>t3&t<=t4);
 v_t4_max=max(v_t4);
 
 v_t5=v_t4_max-1/2*J.*(t-t4).^2.*(t>t4&t<=t5);
 v_t5_min=min(v_t5);
 
 v_t6=v_t5_min-a_max.*(t-t5).*(t>t5&t<=t6);
 v_t6_min=min(v_t6);
 
 v_t7=v_t6_min-a_max.*(t-t6)+1/2*J.*(t-t6).^2.*(t>t6&t<=t7);
 v_t7_min=min(v_t7);
 

 v_t=v_t1.*(t<=t1)...
        +v_t2.*(t>t1&t<=t2)...
        +v_t3.*(t>t2&t<=t3)...
        +v_t4.*(t>t3&t<=t4)...
        +v_t5.*(t>t4&t<=t5)...
        +v_t6.*(t>t5&t<=t6)...
        +v_t7.*(t>t6&t<=t7);
  %v_t=v_s+1/2*J.*t.^2.*(t<=t1)...
      %+v_t1+a_max.*(t-t1).*(t>t1&t<=t2)...
      %+v_t2+a_max.*(t-t2)-1/2*J.*(t-t2).^2.*(t>t2&t<=t3);
    
plot(t,v_t)
xlabel('t/min');
ylabel('V/r/min');
title('S型控制');
%hold on
%plot(t,v_t1);
%plot(t,v_t2);
%plot(t,v_t3);
%plot(t,v_t5);
%plot(t,v_t6);
%hold off
 
 
 