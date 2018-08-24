function myTileGenerator(f, ~, arr)

if isempty(arr)
        arr = [0,0,0,0;0,0,0,0;0,0,0,0;0,0,0,0];
        % Select if the number injected will be a 2 or 4
        nums = [2,4];
        num = datasample(nums,2);
        
        % Select random place to put number that has value 0
        places = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16];
        a = find(arr == 0);
        places = places(a);
        place = datasample(places,2);
        
        
        % Replace 0 with number
        cf = gcf;
        childs = allchild(cf);
        arr(place) = num;
        cf.KeyReleaseFcn{2} = arr;
        childplace = place+1;
        childs(childplace(1)).String = num(1);
        childs(childplace(2)).String = num(2);
        
        % Update tile colors
        x = childplace(1);
        switch num(1)
                case 0
                        childs(x).BackgroundColor = [1 1 0];
                case 2
                        childs(x).BackgroundColor = [1 0 1];
                case 4
                        childs(x).BackgroundColor = [0 1 1];
        end
        x = childplace(2);
        switch num(2)
                case 0
                        childs(x).BackgroundColor = [1 1 0];
                case 2
                        childs(x).BackgroundColor = [1 0 1];
                case 4
                        childs(x).BackgroundColor = [0 1 1];
        end
else
        
        % Select if the number injected will be a 2 or 4
        nums = [2,4];
        num = datasample(nums,1);
        
        % Select random place to put number that has value 0
        places = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16];
        a = find(arr == 0);
        places = places(a);
        place = datasample(places,1);
        
        
        % Replace 0 with number
        cf = gcf;
        childs = allchild(cf);
        arr(place) = num;
        cf.KeyReleaseFcn{2} = arr;
        childplace = place+1;
        childs(childplace).String = num;
        
        % Update tile colors
        x = childplace;
        switch num
                case 0
                        childs(x).BackgroundColor = [1 1 0];
                case 2
                        childs(x).BackgroundColor = [1 0 1];
                case 4
                        childs(x).BackgroundColor = [0 1 1];
        end
        
end

end