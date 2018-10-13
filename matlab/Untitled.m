%%sigma模拟
v_max=3000;
v_min=0;
t=0:0.1:10;
tn=-6:0.1:10;
tn_down=10:0.1:22;
v_t=(v_max./(1+exp(-tn))).*(tn<=6&tn>=-6)...
        +3000*(tn>6&tn<=10);
        %+(v_max./(1+exp(tn))).*(tn<=16&tn>=10);
 v_t_down=v_max./(1+exp(tn_down-16));
 %v_t_down=v_max./(1+exp(tn));
set(gca,'XLim',[-6;22]);
%速度曲线
%hold on
   %plot(tn,v_t);
    %plot(tn_down,v_t_down);
 %hold off
 %加速阶段加速度 a_max=750 r/min
 a_up=(exp(-tn)).*v_max./((1+exp(-tn)).^2);
% plot(tn,a_up);
 %加速度阶段加加速度 j_max=288.6334 r/min
 j_up=(exp(-2.*tn)-exp(-tn)).*v_max./((1+exp(-tn)).^3);
 plot(tn,j_up);

 
