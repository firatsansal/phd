function var_desired=loadvariables(datapath,str,field)
%     function gets the variables in the sutructure array
%         str is needed to load mercury data which defines
%         name of the mat file ex: 'cnt_sup'
%         input field is name of variable in the structure
%         output var_desired selected is selected field
    data         =  load(datapath);
    var_desired1 =  getfield(data,char(str));
    var_desired  =  getfield(var_desired1,char(field));
    
    
end




