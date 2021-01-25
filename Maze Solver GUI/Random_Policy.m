function [ V ] = Random_Policy( horizontal , vertical , goal_i , goal_j , it )
    n = 8 ;
V = zeros( n , n ) ;
v = V ;
for Iteration = 1 : it
    Iteration
    for i = 1 : n
        for j = 1 : n 
            c = 0 ;
            VV = 0 ;
            if i - 1 > 0
                c = c + 1 ;
                if (horizontal(1,:)==(i-1)&horizontal(2,:)==i&horizontal(3,:)==j)==0
                    R = -1 ;
                else
                    R = -2 ;
                end
                VV = VV + V( i - 1 , j ) + R ;

            end
            if i + 1 <= n
                c = c + 1 ;
                if (horizontal(1,:)==i&horizontal(2,:)==(i+1)&horizontal(3,:)==j)==0
                    R = -1 ;
                else
                    R = -2 ;
                end
                VV = VV + V( i + 1 , j ) + R ;
                R = -1 ;
            end
            if j - 1 > 0
                c = c + 1 ;
                if (vertical(1,:)==i&vertical(2,:)==(j-1)&vertical(3,:)==j)==0
                    R = -1 ;
                else
                    R = -2 ;
                end
                VV = VV + V( i , j - 1 ) + R ;
            end
            if j + 1 <= n
                c = c + 1 ;
                if (vertical(1,:)==i&vertical(2,:)==j&vertical(3,:)==(j+1))==0
                    R = -1 ;
                else
                    R = -2 ;
                end
                VV = VV + V( i , j + 1 ) + R ;
            end

            if ( i == goal_i && j == goal_j )
                v( i , j ) = 0 ;
            else 
                v( i , j ) = VV / c ;
            end
        end
    end
    V = v ;
end
V = V ;
end

