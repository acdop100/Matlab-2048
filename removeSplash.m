function removeSplash(f, event, arr)

% Remove Start Splash or Pause Splash 
if strcmp(event.Source.String, 'Start!')
        cf = gcf;
        childs = allchild(cf);
        delete(childs(2))
        delete(childs(1))
        myTileGenerator(f, event, arr)
elseif strcmp(event.Source.String, 'Continue')
        cf = gcf;
        childs = allchild(cf);
        delete(childs(4))
        delete(childs(3))
        delete(childs(2))
        delete(childs(1))
        myTileGenerator(f, event, arr)
else
        cf = gcf;
        childs = allchild(cf);
        delete(childs(2))
        delete(childs(1))
end
end