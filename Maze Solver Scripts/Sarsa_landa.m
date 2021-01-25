clc;clear;close all;

horizontal = [ 2 2 2 2 3 3 7 7 ; 3 3 3 3 4 4 8 8 ; 3 4 5 6 4 5 1 8 ] ;
vertical = [ 3 4 4 5 5 6 5 4 4 3 ; 2 2 3 3 4 4 5 5 6 6 ; 3 3 4 4 5 5 6 6 7 7 ] ;

start_i = 8 ;
start_j = 1 ;
goal_i = 1 ;
goal_j = 8 ;


ep = 1000 ;
gamma = 0.97 ;
epsilon = 0.3 ;
landa = 0.9 ;
alpha = 0.5 ;


Q = zeros( 8 , 8 , 4 ) ;
r = -1 ;
for k = 1 : ep
    %% Initializing Z , S , A
    Z = zeros( 8 , 8 , 4 ) ;
    Xagent = start_j ;
    Yagent = start_i ;
    a_star = 1 ;
    q=1;
    clear X Y
    while ( Xagent ~= goal_j || Yagent ~= goal_i )
        X(q) = Xagent ;
        Y(q) = Yagent ;
        q=q+1;
        %% S' selection
        % Obstacle
        flag = 0 ;
        for i = 1 : size( horizontal , 2 )
            if Xagent == horizontal(3,i) && Yagent == horizontal(1,i) && a_star == 2
                flag = 1 ; 
            end
            if Xagent == horizontal(3,i) && Yagent == horizontal(2,i) && a_star == 1
                flag = 1 ; 
            end
        end
        for i = 1 : size( vertical , 2 )
            if Xagent == vertical(2,i) && Yagent == vertical(1,i) && a_star == 3
                flag = 1 ; 
            end
            if Xagent == vertical(3,i) && Yagent == vertical(1,i) && a_star == 4
                flag = 1 ; 
            end
        end
        % Walls
        if ( Yagent == 1 && a_star == 1 ) || ( Yagent == 8 && a_star == 2 ) || ( Xagent == 8 && a_star == 3 ) || ( Xagent == 1 && a_star == 4 )
            flag = 1 ;
        end
        Yagent_prim = Yagent ;
        Xagent_prim = Xagent ;
        if flag == 0
            switch a_star
                case 1
                    Yagent_prim=Yagent-1 ;
                case 2
                    Yagent_prim=Yagent+1 ;
                case 3
                    Xagent_prim=Xagent+1 ;
                case 4
                    Xagent_prim=Xagent-1 ;
            end
        end
        %% Selecting A' with E-greedy Algorithm
        [~ , a_star_prim] = max( Q( Xagent_prim , Yagent_prim , : ) ) ;
        if rand <= epsilon
            a = a_star_prim;
            while (a==a_star_prim)
                a = ceil( rand * 4 ) ;
            end
            a_star_prim = a ;
        end
        %% Sarsa Algorithm
        delta = r + gamma * Q( Yagent_prim , Xagent_prim , a_star_prim ) - Q( Yagent , Xagent , a_star ) ;
        Z( Yagent , Xagent , a_star ) = Z( Yagent , Xagent , a_star ) + 1 ;
        Q = Q + alpha * delta * Z ;
        Z = gamma * landa * Z ;
        %% S<-S' , A<-A'
        Xagent = Xagent_prim ;
        Yagent = Yagent_prim ;
        a_star = a_star_prim ;
    end
end