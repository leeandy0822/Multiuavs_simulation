function gazebo_plotgraph(payload)
    
    t = 0:0.025:(length(payload.x)-1)*0.025;
   
    figure(2);
    tiledlayout(2,2)
    nexttile
    % Plot position tracking error
    plot(t,payload.ex(1,:),t,payload.ex(2,:),t,payload.ex(3,:),LineWidth=2.0)
    title("Postion Tracking errors",'FontSize', 20);
    legend('ex_1','ex_2','ex_3','FontSize', 15)
    nexttile
    % Plot velocity tracking error
    plot(t,payload.ev(1,:),t,payload.ev(2,:),t,payload.ev(3,:),LineWidth=2.0)
    title("Velocity Tracking errors",'FontSize', 20);
    legend('ev_1','ev_2','ev_3','FontSize', 15)
    
    nexttile
    % Plot rotation tracking error
    plot(t,payload.eR(1,:),t,payload.eR(2,:),t,payload.eR(3,:),LineWidth=2.0)
    title("Rotation Errors",'FontSize', 20);
    legend('er_1','er_2','er_3','FontSize', 15)
    nexttile
    % Plot Omega tracking error
    plot(t,payload.eW(1,:),t,payload.eW(2,:),t,payload.eW(3,:),LineWidth=2.0)
    title("Angular Velocity Errors",'FontSize', 20);
    legend('eo_1','eo_2','eo_3','FontSize', 15)
    
    %% Calculating Error

    figure(3);
    tiledlayout(4,1)
    nexttile
    % Plot necessary
    mass = 7.54;
    theta_m_ground_truth = ones(1, length(t))*mass;
    plot(t,payload.translation_estimation(1,:),t,theta_m_ground_truth,LineWidth=2.0)
    title("Mass",'FontSize', 20);
    legend('Estimated Mass','Ground Truth','FontSize', 15)
    nexttile
    plot(t, payload.rotation_estimation(1,:),t,zeros(1,length(t)),LineWidth=2.0)
    title("CoG (x)",'FontSize', 20);
    legend('Estimate','Ground Truth','FontSize', 15)
    nexttile
    plot(t, payload.rotation_estimation(2,:),t,zeros(1,length(t)),LineWidth=2.0)
    title("CoG (y)",'FontSize', 20);
    legend('Estimate','Ground Truth','FontSize', 15)
    nexttile
    plot(t, payload.rotation_estimation(3,:),t,zeros(1,length(t)),LineWidth=2.0)
    title("CoG (z)",'FontSize', 20);
    legend('Estimate','Ground Truth','FontSize', 15)
    

    
    % 
    % % Plot unnecessary
    % figure(4);
    % tiledlayout(2,3)
    % nexttile
    % plot(t, payload.rotation_estimation(4,:),t,ones(1,length(t))*payload.J(1),LineWidth=2.0)
    % title("Inertia xx",'FontSize', 20);
    % legend('Estimate','Ground Truth','FontSize', 15)
    % nexttile
    % plot(t, payload.rotation_estimation(5,:),t,ones(1,length(t))*payload.J(5),LineWidth=2.0)
    % title("Inertia yy",'FontSize', 20);
    % legend('Estimate','Ground Truth','FontSize', 15)
    % nexttile
    % plot(t, payload.rotation_estimation(6,:),t,ones(1,length(t))*payload.J(9),LineWidth=2.0)
    % title("Inertia zz",'FontSize', 20);
    % legend('Estimate','Ground Truth','FontSize', 15)
    % nexttile
    % plot(t, payload.translation_estimation(2,:),t,ones(1,length(t))*payload.body2CoG(1),LineWidth=2.0)
    % title("From Mass CoG (x)",'FontSize', 20);
    % legend('Estimate','Ground Truth','FontSize', 15)
    % nexttile
    % plot(t, payload.translation_estimation(3,:),t,ones(1,length(t))*payload.body2CoG(2),LineWidth=2.0)
    % title("From Mass CoG (y)",'FontSize', 20);
    % legend('Estimate','Ground Truth','FontSize', 15)
    % nexttile
    % plot(t, payload.translation_estimation(4,:),t,ones(1,length(t))*payload.body2CoG(3),LineWidth=2.0)
    % title("From Mass CoG (z)",'FontSize', 20);
    % legend('Estimate','Ground Truth','FontSize', 15)
    
    
    % % resultant force
    % figure(5)
    % tiledlayout(2,1)
    % nexttile
    % plot(t, payload.force(1,:), t , payload.force(2,:), t , payload.force(3,:),LineWidth=2.0);
    % title("Force Input",'FontSize', 20);
    % legend('x','y','z','FontSize', 15)
    % nexttile
    % plot(t, payload.moment(1,:), t , payload.moment(2,:), t , payload.moment(3,:),LineWidth=2.0);
    % title("Moment Input",'FontSize', 20);
    % legend('x','y','z','FontSize', 15)
end