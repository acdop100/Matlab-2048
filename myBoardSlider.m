function myBoardSlider(f, event, arr, scorenum)

a = find(arr == 0);
b = find(arr ~= 0);
num = arr(b);
oldarr = arr;
endd = false;

% Fill empty spaces
switch event.Key
        case 'downarrow'
                oz = b(end:-1:1);
                num = num(end:-1:1);
                for y = 1:length(b)
                        a = find(arr == 0);
                        b = find(arr ~= 0);
                        z = b(end:-1:1);
                        c = find(a == z(y)+1);
                        if ~isempty(c) & mod(z(y),4) ~= 0
                                z(y) = a(c);
                        end
                        d = find(a == z(y)+1);
                        if ~isempty(d) & mod(z(y),4) ~= 0
                                z(y) = a(d);
                        end
                        e = find(a == z(y)+1);
                        if ~isempty(e) & mod(z(y),4) ~= 0
                                z(y) = a(e);
                        end
                        arr(oz(y)) = 0;
                        arr(z(y)) = num(y);
                end
        case 'uparrow'
                oz = b;
                 num = num;
                for y = 1:length(b)
                        a = find(arr == 0);
                        b = find(arr ~= 0);
                        z = b;
                        c = find(a == z(y)-1);
                        if ~isempty(c) & mod(z(y)-1,4) ~= 0
                                z(y) = a(c);
                        end
                        d = find(a == z(y)-1);
                        if ~isempty(d) & mod(z(y)-1,4) ~= 0
                                z(y) = a(d);
                        end
                        e = find(a == z(y)-1);
                        if ~isempty(e) & mod(z(y)-1,4) ~= 0
                                z(y) = a(e);
                        end
                        arr(oz(y)) = 0;
                        arr(z(y)) = num(y);
                end
        case 'rightarrow'
                oz = b(end:-1:1);
                num = num(end:-1:1);
                for y = 1:length(b)
                        a = find(arr == 0);
                        b = find(arr ~= 0);
                        z = b(end:-1:1);
                        c = find(a == z(y)+4);
                        if ~isempty(c) & z(y) <= 12
                                z(y) = a(c);
                        end
                        d = find(a == z(y)+4);
                        if ~isempty(d) & z(y) <= 12
                                z(y) = a(d);
                        end
                        e = find(a == z(y)+4);
                        if ~isempty(e) & z(y) <= 12
                                z(y) = a(e);
                        end
                        arr(oz(y)) = 0;
                        arr(z(y)) = num(y);
                end
        case 'leftarrow'
                oz = b;
                num = num;
                for y = 1:length(b)
                        a = find(arr == 0);
                        b = find(arr ~= 0);
                        z = b;
                        c = find(a == z(y)-4);
                        if ~isempty(c) & z(y) > 4
                                z(y) = a(c);
                        end
                        d = find(a == z(y)-4);
                        if ~isempty(d) & z(y) > 4
                                z(y) = a(d);
                        end
                        e = find(a == z(y)-4);
                        if ~isempty(e) & z(y) > 4
                                z(y) = a(e);
                        end
                        arr(oz(y)) = 0;
                        arr(z(y)) = num(y);
                end
end

count = 0;

% Add numbers if possible
switch event.Key
        case 'downarrow'
                for x = 1:4
                        if arr(3,x) == arr(4,x)
                                scorenum = scorenum + arr(3, x) + arr(4, x);
                                arr(4,x) = arr(3, x) + arr(4, x);
                                arr(3,x) = arr(2,x);
                                arr(2,x) = arr(1,x);
                        elseif arr(3, x) == arr(2, x)
                                scorenum = scorenum + arr(3, x) + arr(2, x);
                                count = count + 1;
                                arr(3,x) = arr(3,x) + arr(2,x);
                                arr(2,x) = arr(1,x);
                                arr(1,x) = 0;
                        else
                                count = count + 2;
                        end
                        if arr(1,x) == arr(2,x)
                                scorenum = scorenum + arr(1, x) + arr(2, x);
                                arr(2,x) = arr(1,x) + arr(2,x);
                                arr(1,x) = 0;
                        else 
                                count = count + 1;
                        end
                end
                if count == 12
                        endd = true;
                end
        case 'uparrow'
                for x = 1:4
                        if arr(3,x) == arr(4,x)
                                scorenum = scorenum + arr(3, x) + arr(4, x);
                                arr(3,x) = arr(3, x) + arr(4, x);
                                arr(4,x) = 0;
                        else
                                count = count + 1;
                                if arr(3,x) == arr(2,x)
                                        scorenum = scorenum + arr(3, x) + arr(2, x);
                                        arr(2,x) = arr(3, x) + arr(2, x);
                                        arr(3, x) = arr(4, x);
                                else
                                        count = count + 2;
                                end
                        end
                        if arr(2,x) == arr(1,x) & count <= x * 2 + 1
                                scorenum = scorenum + arr(1, x) + arr(2, x);
                                arr(1,x) = arr(1, x) + arr(2, x);
                                arr(2,x) = arr(3,x);
                                arr(3,x) = arr(4,x);
                        else
                                count = count + 1;
                        end
                end
                if count == 12
                        endd = true;
                end
        case 'leftarrow'
                for x = 1:3
                        if arr(4,x) == arr(4,x+1)
                                scorenum = scorenum + arr(4,x) + arr(4,x+1);
                                arr(4,x) = arr(4,x) + arr(4,x+1);
                                if x == 3
                                        arr(4,4) = 0;
                                elseif x== 2
                                        arr(4,3) = arr(4,4);
                                        arr(4,4) = 0;
                                elseif x == 1
                                        arr(4,2) = arr(4,3);
                                        arr(4,3) = arr(4,4);
                                        arr(4,4) = 0;
                                end
                        else
                                count = count + 1;
                        end
                        if arr(3,x) == arr(3,x+1)
                                scorenum = scorenum + arr(3,x) + arr(3,x+1);
                                arr(3,x) = arr(3,x) + arr(3,x+1);
                                if x == 3
                                        arr(3,4) = 0;
                                elseif x== 2 
                                        arr(3,3) = arr(3,4);
                                        arr(3,4) = 0;
                                elseif x == 1
                                        arr(3,2) = arr(3,3);
                                        arr(3,3) = arr(3,4);
                                        arr(3,4) = 0;
                                end
                        else
                                count = count + 1;
                        end
                        if arr(2,x) == arr(2,x+1)
                                scorenum = scorenum + arr(2,x) + arr(2,x+1);
                                arr(2,x) = arr(2,x) + arr(2,x+1);
                                if x == 3
                                        arr(2,4) = 0;
                                elseif x== 2 
                                        arr(2,3) = arr(2,4);
                                        arr(2,4) = 0;
                                elseif x == 1
                                        arr(2,2) = arr(2,3);
                                        arr(2,3) = arr(2,4);
                                        arr(2,4) = 0;
                                end
                        end
                        if arr(1,x) == arr(1,x+1)
                                scorenum = scorenum + arr(1,x) + arr(1,x+1);
                                arr(1,x) = arr(1,x) + arr(1,x+1);

                                if x == 3
                                        arr(1,4) = 0;
                                elseif x== 2
                                        arr(1,3) = arr(1,4);
                                        arr(1,4) = 0;
                                elseif x == 1
                                        arr(1,2) = arr(1,3);
                                        arr(1,3) = arr(1,4);
                                        arr(1,4) = 0;
                                end
                        else
                                count = count + 1;
                        end
                end
                if count == 9
                        endd = true;
                end
        case 'rightarrow'
                for x = 4:-1:2
                        if arr(1,x) == arr(1,x-1)
                                scorenum = scorenum + arr(1,x) + arr(1,x-1);
                                arr(1,x) = arr(1,x) + arr(1,x-1);
                                if x == 2
                                        arr(1,1) = 0;
                                elseif x==3
                                        arr(1,2) = arr(1,1);
                                        arr(1,1) = 0;
                                elseif x == 4
                                        arr(1,3) = arr(1,2);
                                        arr(1,2) = arr(1,1);
                                        arr(1,1) = 0;
                                end
                        else
                                count = count + 1;
                        end
                        if arr(2,x) == arr(2,x-1)
                                scorenum = scorenum + arr(2,x) + arr(2,x-1);
                                arr(2,x) = arr(2,x) + arr(2,x-1);
                                if x == 2
                                        arr(2,1) = 0;
                                elseif x==3 
                                        arr(2,2) = arr(2,1);
                                        arr(2,1) = 0;
                                elseif x == 4
                                        arr(2,3) = arr(2,2);
                                        arr(2,2) = arr(2,1);
                                        arr(2,1) = 0;
                                end
                        end
                        if arr(3,x) == arr(3,x-1)
                                scorenum = scorenum + arr(3,x) + arr(3,x-1);
                                arr(3,x) = arr(3,x) + arr(3,x-1);
                                if x == 2
                                        arr(3,1) = 0;
                                elseif x==3 
                                        arr(3,2) = arr(3,1);
                                        arr(3,1) = 0;
                                elseif x == 4
                                        arr(3,3) = arr(3,2);
                                        arr(3,2) = arr(3,1);
                                        arr(3,1) = 0;
                                end
                        else
                                count = count + 1;
                        end
                        if arr(4,x) == arr(4,x-1)
                                scorenum = scorenum + arr(4,x) + arr(4,x-1);
                                arr(4,x) = arr(4,x) + arr(4,x-1);
                                if x == 2
                                        arr(4,1) = 0;
                                elseif x==3 
                                        arr(4,2) = arr(4,1);
                                        arr(4,1) = 0;
                                elseif x == 4
                                        arr(4,3) = arr(4,2);
                                        arr(4,2) = arr(4,1);
                                        arr(4,1) = 0;
                                end
                        else
                                count = count + 1;
                        end
                end
                if count == 9
                        endd = true;
                end
end

% Update score
cf = gcf;
childs = allchild(cf);
score = childs(18);
oldscore = str2num(score.String);
scorenum = scorenum + oldscore;
scorenum = num2str(scorenum);
score.String = scorenum;

% Update tile numbers & colors
x = 0;
for x = 2:17
        if oldarr(x-1) ~= 0
                childs(x).String = '';
        end
end

for x = 2:17
        if arr(x-1) ~= 0
                childs(x).String = arr(x-1);
        end
        switch arr(x-1)
                case 0
                        childs(x).FontSize = 30;
                        childs(x).BackgroundColor = [1 1 0];
                case 2
                        childs(x).FontSize = 30;
                        childs(x).BackgroundColor = [1 0 1];
                case 4
                        childs(x).FontSize = 30;
                        childs(x).BackgroundColor = [0 1 1];
                case 8
                        childs(x).FontSize = 30;
                        childs(x).BackgroundColor = [.5 1 0];
                case 16
                        childs(x).FontSize = 30;
                        childs(x).BackgroundColor = [1 0 .5];
                case 32
                        childs(x).FontSize = 30;
                        childs(x).BackgroundColor = [0 .5 1];
                case 64
                        childs(x).FontSize = 30;
                        childs(x).BackgroundColor = [.5 .5 0];
                case 128
                        childs(x).FontSize = 20;
                        childs(x).BackgroundColor = [.5 0 .5];
                case 256
                        childs(x).FontSize = 20;
                        childs(x).BackgroundColor = [0 .5 .5];
                case 512
                        childs(x).FontSize = 20;
                        childs(x).BackgroundColor = [.5 1 .5];
                case 1024
                        childs(x).FontSize = 10;
                        childs(x).BackgroundColor = [1 .5 .5];
                case 2048
                        childs(x).FontSize = 10;
                        childs(x).BackgroundColor = [1 1 1];
                case 4096
                        childs(x).FontSize = 10;
                        childs(x).ForegroundColor = 'w';
                        childs(x).BackgroundColor = [0 0 0];
        end
end

% If endd = true, end that game
check = checker(arr);
if endd == true & isempty(find(arr == 0)) & check == 46
        endGame
end

% See if won
if find(arr == 2048) > 0
        @win
end

% Generate new tiles
if ~isequal(oldarr, arr)
        pause(0.04);
        myTileGenerator(f, event, arr)
end

end

function check = checker(arr)
count = 0;
for x = 1:4
        if arr(3,x) == arr(4,x)
                arr(4,x) = arr(3, x) + arr(4, x);
                arr(3,x) = arr(2,x);
                arr(2,x) = arr(1,x);
        elseif arr(3, x) == arr(2, x)
                count = count + 1;
                arr(3,x) = arr(3,x) + arr(2,x);
                arr(2,x) = arr(1,x);
                arr(1,x) = 0;
        else
                count = count + 2;
        end
        if arr(1,x) == arr(2,x)
                arr(2,x) = arr(1,x) + arr(2,x);
                arr(1,x) = 0;
        else
                count = count + 1;
        end
end
for x = 1:4
        if arr(3,x) == arr(4,x)
                arr(3,x) = arr(3, x) + arr(4, x);
                arr(4,x) = 0;
        else
                count = count + 1;
                if arr(3,x) == arr(2,x)
                        arr(2,x) = arr(3, x) + arr(2, x);
                        arr(3, x) = arr(4, x);
                else
                        count = count + 2;
                end
        end
        if arr(2,x) == arr(1,x) & count <= x * 2 + 1
                arr(1,x) = arr(1, x) + arr(2, x);
                arr(2,x) = arr(3,x);
                arr(3,x) = arr(4,x);
        else
                count = count + 1;
        end
end
for x = 1:3
        if arr(4,x) == arr(4,x+1)
                arr(4,x) = arr(4,x) + arr(4,x+1);
                if x == 3
                        arr(4,4) = 0;
                elseif x== 2
                        arr(4,3) = arr(4,4);
                        arr(4,4) = 0;
                elseif x == 1
                        arr(4,2) = arr(4,3);
                        arr(4,3) = arr(4,4);
                        arr(4,4) = 0;
                end
        else
                count = count + 1;
        end
        if arr(3,x) == arr(3,x+1)
                arr(3,x) = arr(3,x) + arr(3,x+1);
                if x == 3
                        arr(3,4) = 0;
                elseif x== 2
                        arr(3,3) = arr(3,4);
                        arr(3,4) = 0;
                elseif x == 1
                        arr(3,2) = arr(3,3);
                        arr(3,3) = arr(3,4);
                        arr(3,4) = 0;
                end
        else
                count = count + 1;
        end
        if arr(2,x) == arr(2,x+1)
                arr(2,x) = arr(2,x) + arr(2,x+1);
                if x == 3
                        arr(2,2) = 0;
                elseif x== 2
                        arr(2,3) = arr(2,4);
                        arr(2,4) = 0;
                elseif x == 1
                        arr(2,2) = arr(2,3);
                        arr(2,3) = arr(2,4);
                        arr(2,4) = 0;
                end
        end
        if arr(1,x) == arr(1,x+1)
                arr(1,x) = arr(1,x) + arr(1,x+1);
                
                if x == 3
                        arr(1,4) = 0;
                elseif x== 2
                        arr(1,3) = arr(1,4);
                        arr(1,4) = 0;
                elseif x == 1
                        arr(1,2) = arr(1,3);
                        arr(1,3) = arr(1,4);
                        arr(1,4) = 0;
                end
        else
                count = count + 1;
        end
end
for x = 4:-1:2
        if arr(1,x) == arr(1,x-1)
                arr(1,x) = arr(1,x) + arr(1,x-1);
                if x == 2
                        arr(1,1) = 0;
                elseif x==3
                        arr(1,2) = arr(1,1);
                        arr(1,1) = 0;
                elseif x == 4
                        arr(1,3) = arr(1,2);
                        arr(1,2) = arr(1,1);
                        arr(1,1) = 0;
                end
        else
                count = count + 1;
        end
        if arr(2,x) == arr(2,x-1)
                arr(2,x) = arr(2,x) + arr(2,x-1);
                if x == 2
                        arr(2,1) = 0;
                elseif x==3
                        arr(2,2) = arr(2,1);
                        arr(2,1) = 0;
                elseif x == 4
                        arr(2,3) = arr(2,2);
                        arr(2,2) = arr(2,1);
                        arr(2,1) = 0;
                end
        end
        if arr(3,x) == arr(3,x-1)
                arr(3,x) = arr(3,x) + arr(3,x-1);
                if x == 2
                        arr(3,1) = 0;
                elseif x==3
                        arr(3,2) = arr(3,1);
                        arr(3,1) = 0;
                elseif x == 4
                        arr(3,3) = arr(3,2);
                        arr(3,2) = arr(3,1);
                        arr(3,1) = 0;
                end
        else
                count = count + 1;
        end
        if arr(4,x) == arr(4,x-1)
                arr(4,x) = arr(4,x) + arr(4,x-1);
                if x == 2
                        arr(4,1) = 0;
                elseif x==3
                        arr(4,2) = arr(4,1);
                        arr(4,1) = 0;
                elseif x == 4
                        arr(4,3) = arr(4,2);
                        arr(4,2) = arr(4,1);
                        arr(4,1) = 0;
                end
        else
                count = count + 1;
        end
end 
check = count;
end

function win(f, event)
f = gcf;
childs = allchild(f);

ewtxt = uicontrol(f, 'Style','text','String','You Won!', ...
    'FontSize',50, 'Position', [0 0 561 551], ...
    'BackgroundColor','k','ForegroundColor','w', ...
    'HorizontalAlignment','center');

wtxt2 = uicontrol(f, 'Style','text','String',"Continue Playing?", ...
    'FontSize',20, 'Position', [135 200 300 200], ...
    'BackgroundColor','k','ForegroundColor','w', ...
    'HorizontalAlignment','center');

conplaybtn = uicontrol(f, 'Style','pushbutton','FontName', ...
    'Comic Sans MS','String','Continue', ...
    'FontSize',15, 'Position', [230 225 100 40]);

endbtn = uicontrol(f, 'Style','pushbutton','FontName', ...
    'Comic Sans MS','String','Quit', ...
    'FontSize',15, 'Position', [230 150 100 40]);

rconplaybtn.Callback = @removeSplash;
endbtn.Callback = @closef;



end

function endGame(f,event) % fill in the two inputs for a callback function

% does anything extra you would like to put in

f = gcf;
childs = allchild(f);

etxt = uicontrol(f, 'Style','text','String','You Lost', ...
    'FontSize',50, 'Position', [0 0 561 551], ...
    'BackgroundColor','k','ForegroundColor','w', ...
    'HorizontalAlignment','center');

etxt2 = uicontrol(f, 'Style','text','String',"You're all out of moves!", ...
    'FontSize',20, 'Position', [135 200 300 200], ...
    'BackgroundColor','k','ForegroundColor','w', ...
    'HorizontalAlignment','center');

replaybtn = uicontrol(f, 'Style','pushbutton','FontName', ...
    'Comic Sans MS','String','Replay?', ...
    'FontSize',15, 'Position', [230 225 100 40]);

endbtn = uicontrol(f, 'Style','pushbutton','FontName', ...
    'Comic Sans MS','String','Quit', ...
    'FontSize',15, 'Position', [230 150 100 40]);

replaybtn.Callback = @play;
endbtn.Callback = @closef;
end

function play(f, event)
f = gcf;
childs = allchild(f);
close(f)
play2048
end

function closef(f, event)
f = gcf;
childs = allchild(f);
qtxt = uicontrol(f, 'Style','text','String','Quiting... :(', ...
    'FontSize',50, 'Position', [0 0 561 551], ...
    'BackgroundColor','k','ForegroundColor','w', ...
    'HorizontalAlignment','center');
pause(0.7);
close(f)
end
