-- This script was generated using the MoonVeil Obfuscator v1.4.0 [https://moonveil.cc]

local bd=(getfenv())
local Wb,td,Cd=(string.char),(string.byte),(bit32 .bxor)
local D=function(r,lc)
    local M=''
    for Sb=-222112/-2524,(#r-(-29023- -29024))+(-3485+3573)do
        M=M..Wb(Cd(td(r,(Sb-(10613-10525))+(14357+-14356)),td(lc,(Sb- -0.0032153165990719428*-27369)%#lc+31502/31502)))
    end
    return M
end
local ud,K=(string.gsub),(string.char)
local Cc=(function(l)
    l=ud(l,'[^ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/=]','')
    return(l:gsub('.',function(Md)
        if(Md=='=')then
            return''
        end
        local Ka,ic='',(('ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'):find(Md)-1)
        for Hb=6,1,-1 do
            Ka=Ka..(ic%2^Hb-ic%2^(Hb-1)>0 and'1'or'0')
        end
        return Ka;
    end):gsub('%d%d%d?%d?%d?%d?%d?%d?',function(dd)
        if(#dd~=8)then
            return''
        end
        local s=0
        for mb=1,8 do
            s=s+(dd:sub(mb,mb)=='1'and 2^(8-mb)or 0)
        end
        return K(s)
    end))
end)
return(function(Cb,...)
    local function Ac(Ia)
        return Cb[Ia+(-19562+23060)]
    end;
    local Yc,db={[Ac(-209334336/-8616)]={["name"]="Forsaken",["url"]="https://raw.githubusercontent.com/Yomkaa/forsaken-YOXI-HUB/refs/heads/main/forsaken%20YOXI%20HUB"},[Ac(-13442- -16632)]={["name"]=Ac(-20664+21916),["url"]="https://raw.githubusercontent.com/Yomkaa/gag-YOXI-HUB/refs/heads/main/YOXIHUBGAG"},["9872472334"]={[Ac(-689974142/22133)]=Ac(-51200+23758),["url"]="https://raw.githubusercontent.com/Yomkaa/Evade-YOXI-HUB/refs/heads/main/evade"},[Ac(-155769882/15027)]={[Ac(41661+-17225)]="Evade",[Ac(-4648-11602)]="https://raw.githubusercontent.com/Yomkaa/Evade-YOXI-HUB/refs/heads/main/evade"},["10662542523"]={[Ac(234671976/-24188)]="Evade",["url"]=Ac(479541074/17398)},["9872472334"]={[Ac(-8658240/-4640)]=Ac(-40158- -8279),[Ac(8866- -9837)]="https://raw.githubusercontent.com/Yomkaa/Evade-YOXI-HUB/refs/heads/main/evade"},["11353528705"]={[Ac(-43313- -20713)]="Evade",["url"]="https://raw.githubusercontent.com/Yomkaa/Evade-YOXI-HUB/refs/heads/main/evade"},[Ac(-45578- -32580)]={["name"]=Ac(38869-12396),[Ac(2.0363190730837788*4488)]=Ac(7165-23329)},["16116270224"]={["name"]=Ac(0.39272557160399979*17101),[Ac(3061+-10599)]="https://raw.githubusercontent.com/Yomkaa/DANDY-S-WORLD-YOXI-HUB/refs/heads/main/TG_%40YomkaMadeIt"},["16552821455"]={[Ac(-0.050118831259611349*-28612)]=Ac(-9414+-14017),["url"]=Ac(-85176294/-15281)},["142823291"]={[Ac(59281+-30429)]="MM2",[Ac(-0.60560011256507673*-28428)]=Ac(-421256900/-16820)},["12411473842"]={["name"]="Pressure",["url"]="https://raw.githubusercontent.com/Yomkaa/PRESSURE-YOXI-HUB/refs/heads/main/PRESSURE"},[Ac(-1.6496650290308172*-11195)]={[Ac(-1.0506754289886819*-13695)]="Pressure",["url"]=Ac(35751716/-1001)},["138837502355157"]={[Ac(-34643- -22945)]="Grace",["url"]=Ac(-7.4226457399103136*-892)},["110333320616502"]={[Ac(127303680/-6720)]="Grace",["url"]="https://raw.githubusercontent.com/Yomkaa/Grace-YOXI-HUB/refs/heads/main/grace"},["15532190432"]={[Ac(-1.5021129893238434*8992)]="Bow Battle Arena",[Ac(-32166- -1650)]=Ac(-27730- -7368)},["85896571713843"]={[Ac(0.58970840480274445*17490)]="Bubble Gum Simulator",["url"]="https://gist.githubusercontent.com/Yomkaa/bbfa2bcb37eb8df24fe912ac2f9d231cd4c0fb8/YOXI%2520HUB%2520BGS"}},{}
    for z,Qa in bd["pairs"](Yc)do
        db[z]=Qa
    end
    local _c,Y,Nc,O,Rb,Od={["name"]="UNIVERSAL",[Ac(-47983- -22609)]=Ac(-11925+11368)},bd["game"]:GetService("Players"),bd["game"]:GetService(Ac(46596-21427)),bd["game"]:GetService("HttpService"),bd["game"]:GetService(Ac(-19761+27011)),bd["game"]:GetService(Ac(-192911432/-11221))
    local function Xd(sd)
        return(function(Z)
            local function o(Rd)
                return Z[Rd+(34322-14714)]
            end;
            if not sd or sd==''then
                return o(0.70544951187527316*13726),o(-619122855/21045)
            end
            if not(bd[D("73","Cc")](bd[D("¨¢","Ïë")][D("Áù²ý","õè")])==o((-19137729873600/-28736)/(-40712- -24287)))then
            else
                local ob,B=bd["pcall"](function()
                    return(function(Jd)
                        local function ac(xc)
                            return Jd[xc+(36514-14135)]
                        end;
                        return bd["game"]:HttpGet(sd,ac(0.40706605222734255*-651))
                    end)({[43998+-21884]=true})
                end)
                if ob and B and#B>o(-17796+-15044)then
                    return B
                end
            end
            if O and bd["type"](O["GetAsync"])==o(-686- -3064)then
                local Za,pb=bd["pcall"](function()
                    return O:GetAsync(sd)
                end)
                if not(Za and pb and#pb>o((9619.43668409571/6152)*(-43694+14815)))then
                else
                    return pb
                end
            end
            if not(bd[D("áå","è")](bd[D(">ö>ô","ô[")])==o(1281279630/-28745-(-9190+-22095)))then
            else
                local d,hc=bd["pcall"](function()
                    return(function(Jb)
                        local function Pd(Fb)
                            return Jb[Fb-(18138+8298)]
                        end;
                        local zc=bd["request"]({[Pd(44335368/-7623)]=sd,[Pd(-13920- -7890)]="GET"})
                        if zc then
                            return zc["Body"]
                        end
                        return nil
                    end)({[-9968-22498]="Method",[1.6269989406245271*-19823]="Url"})
                end)
                if d and hc and#hc>o(-73801- -27029)then
                    return hc
                end
            end
            if bd["type"](bd["syn"])=="table"and bd["type"](bd["syn"]["request"])==o(-7967975/1675)then
                local Sa,R=bd["pcall"](function()
                    return(function(Q)
                        local function yb(wa)
                            return Q[wa-(-15992- -7016)]
                        end;
                        return bd["syn"]["request"]({["Url"]=sd,[yb(-67675+31887)]="GET"})
                    end)({[1.1686353136032777*-22943]="Method"})
                end)
                if Sa and R and R["Body"]and#R["Body"]>o(-28356+9179)then
                    return R["Body"]
                end
            end
            return o(-64609- -21283),o(-28077+-1697)
        end)({[3285- -3034]="function",[-0.018793058341327287*-22934]=0,[-39938- -12774]=0,[-294742838/28993]="no http method available or empty response",[-0.94238715829624919*25168]=nil,[-0.47213301933918506*28026]=0,[-32835- -11896]="function",[-233805941/23831]="empty url",[49962+-27976]="function",[-7500+22351]="function",[6479+-32027]=0,[11008+18283]=nil})
    end
    local function V(Lc)
        return(function(qb)
            local function Kd(_a)
                return qb[_a+(-13448+18056)]
            end;
            if not Lc or Lc==Kd(-13811+-2267)then
                return false,"empty source"
            end
            local rd,Xa
            if bd["type"](bd["loadstring"])==Kd(-3.2305467168064794*-3457)then
                rd,Xa=bd["loadstring"](Lc)
            else
                rd,Xa=bd["load"](Lc)
            end
            if not(not rd)then
            else
                return false,Kd(35700+-28239):format(bd["tostring"](Xa))
            end
            local za,la=bd["pcall"](rd)
            if not za then
                return false,("runtime error: %s"):format(bd["tostring"](la))
            end
            return Kd(0.21496533913279869*29428),la
        end)({[-51445536/-3261]="function",[9354-20824]='',[12558+-489]=("compile error: %s"),[11131-197]=true})
    end
    local function lb()
        return(function(Ba)
            local function Va(nd)
                return Ba[nd+(-42273- -29054)]
            end;
            local Pc=bd["game"]:GetService(Va(-0.097848113480652324*-20726))
            for ba,mc in bd["pairs"](Pc:GetChildren())do
                if mc["Name"]=="YOXI_ROUTER_UI_V3"then
                    bd["pcall"](function()
                        mc:Destroy()
                    end)
                end
            end
            local Hd=bd["Instance"]["new"]("ScreenGui")
            Hd["Name"]="YOXI_ROUTER_UI_V3"
            Hd["ResetOnSpawn"]=false
            Hd["ZIndexBehavior"]=bd["Enum"]["ZIndexBehavior"]["Global"]
            Hd["IgnoreGuiInset"]=true
            Hd["Parent"]=Pc
            local Zb=bd["Instance"]["new"](Va(11257- -28735))
            Zb["Name"]="YOXINotifBlur"
            Zb["Size"]=Va(-358255968/-7957)
            Zb["Parent"]=Od
            local Ua=bd["Instance"]["new"](Va(0.24505944570360649*25149))
            Ua["Name"]="YOXI_DarkOverlay"
            Ua["AnchorPoint"]=bd["Vector2"]["new"](Va(-1072131572/-24212),0)
            Ua["Position"]=bd["UDim2"]["new"](Va(41830752/5969),0,0,0)
            Ua["Size"]=bd["UDim2"]["new"](1994/1994,0,Va(-202568450/-13006),Va(70954-30516))
            Ua["BackgroundColor3"]=bd["Color3"]["fromRGB"](Va(35002+-14120),Va(-28468+32045),0)
            Ua["BackgroundTransparency"]=-1545+1546
            Ua["BorderSizePixel"]=Va(185191465/9143)
            Ua["ZIndex"]=23400-23399
            Ua["Parent"]=Hd
            local Ob=bd["Instance"]["new"](Va(11556-15700))
            Ob["Name"]="YOXIColorFX"
            Ob["Enabled"]=Va(-21740- -21471)
            Ob["Brightness"]=Va(-11793- -3362)
            Ob["Contrast"]=0
            Ob["Saturation"]=Va(35244+6317)
            Ob["Parent"]=Od
            local P=bd["Instance"]["new"](Va(34111+-28377))
            P["Name"]="YOXIBloom"
            P["Enabled"]=false
            P["Intensity"]=Va(-47890+31565)
            P["Threshold"]=Va(-0.65320566194837637*2402)
            P["Size"]=29878-29870
            P["Parent"]=Od
            local Db=bd["Instance"]["new"]("Frame")
            Db["Name"]="Container"
            Db["AnchorPoint"]=bd["Vector2"]["new"](2.255299954894001e-05*22170,-16336.5+16337)
            Db["Position"]=bd["UDim2"]["new"](-18926.5- -18927,0,-1582.5/-3165,0)
            Db["Size"]=bd["UDim2"]["fromScale"](7394.8800000000001/15406,-7.4363992172211354e-06*-25550)
            Db["BackgroundTransparency"]=Va(4283-8866)
            Db["BorderSizePixel"]=Va(-31384768/-29168)
            Db["ClipsDescendants"]=true
            Db["ZIndex"]=Va(-309888334/-8057)
            Db["Parent"]=Hd
            local Oc=bd["Instance"]["new"]("UICorner",Db)
            Oc["CornerRadius"]=bd["UDim"]["new"](0,-0.0004413387274733358*-27190)
            local f=bd["Instance"]["new"]("UIStroke")
            f["Thickness"]=0
            f["Transparency"]=Va(-1.2777586008514554*-8691)
            f["Color"]=bd["Color3"]["fromRGB"](-724200/-6035,Va(-1142+-9532),Va(24259+-24662))
            f["ApplyStrokeMode"]=bd["Enum"]["ApplyStrokeMode"]["Border"]
            f["Parent"]=Db
            local ub=bd["Instance"]["new"]("UIScale",Db)
            ub["Scale"]=-4.5175280086736539e-05*-22136
            local zb=bd["Instance"]["new"]("Frame")
            zb["Name"]="ContentHolder"
            zb["Size"]=bd["UDim2"]["fromScale"](Va(8409+2947),18561-18560)
            zb["BackgroundTransparency"]=Va(13539+27537)
            zb["Parent"]=Db
            zb["ZIndex"]=5826/1942
            local a=bd["Instance"]["new"](Va(-0.081703884406079938*26645),zb)
            a["FillDirection"]=bd["Enum"]["FillDirection"]["Horizontal"]
            a["VerticalAlignment"]=bd["Enum"]["VerticalAlignment"]["Center"]
            a["HorizontalAlignment"]=bd["Enum"]["HorizontalAlignment"]["Center"]
            a["SortOrder"]=bd["Enum"]["SortOrder"]["LayoutOrder"]
            a["Padding"]=bd["UDim"]["new"](0,Va(1.3636153184734441*30238))
            local qc=bd["Instance"]["new"](Va(-18282- -6296))
            qc["Name"]=Va(15607-32047)
            qc["Size"]=bd["UDim2"]["fromScale"](4378.3199999999997/24324,-20269.860000000001/-25987)
            qc["BackgroundTransparency"]=-0.00061614294516327791*-1623
            qc["LayoutOrder"]=-22015/-22015
            qc["Parent"]=zb
            qc["ZIndex"]=Va(-0.21342896383335877*32765)
            local ha=bd["Instance"]["new"]("ImageLabel",qc)
            ha["Name"]="IconImage"
            ha["Size"]=bd["UDim2"]["fromScale"](Va(19534- -3711),Va(58579-18306))
            ha["BackgroundTransparency"]=Va(10198+32742)
            ha["Image"]=Va(-59312132/4796)
            ha["ScaleType"]=bd["Enum"]["ScaleType"]["Fit"]
            ha["ImageTransparency"]=Va(-6735+-4354)
            ha["AnchorPoint"]=bd["Vector2"]["new"](8240.5-8240,1329.5+-1329)
            ha["Position"]=bd["UDim2"]["fromScale"](Va(-0.99639165800256868*-16351),2323.5/4647)
            local bc=bd["Instance"]["new"](Va(0.34142122072391767*22544),ha)
            bc["CornerRadius"]=bd["UDim"]["new"](0,Va(6647+-16060))
            local Dc=bd["Instance"]["new"]("TextLabel",qc)
            Dc["Name"]="IconSuccess"
            Dc["Text"]=Va(-12120+27379)
            Dc["Font"]=bd["Enum"]["Font"]["GothamBlack"]
            Dc["TextColor3"]=bd["Color3"]["fromRGB"](-0.0035702809811132136*-28009,0.009659822713841958*26398,Va(-3641+20491))
            Dc["TextScaled"]=Va(17812-1010)
            Dc["Size"]=bd["UDim2"]["fromScale"](Va(-0.5888544445245476*13871),Va(15196+-28728))
            Dc["BackgroundTransparency"]=14851-14850
            Dc["TextTransparency"]=4.7373158368468427e-05*21109
            Dc["ZIndex"]=Va(356125790/8441)
            local na=bd["Instance"]["new"](Va(-1.865498061688859*-5933))
            na["Name"]="TextGroup"
            na["Size"]=bd["UDim2"]["new"](0,0,6599.3599999999997/8048,Va(-1.050336148939838*-5801))
            na["BackgroundTransparency"]=4372+-4371
            na["LayoutOrder"]=-3732- -3734
            na["Parent"]=zb
            na["ZIndex"]=-22703- -22707
            local Gb=bd["Instance"]["new"]("UIListLayout",na)
            Gb["FillDirection"]=bd["Enum"]["FillDirection"]["Vertical"]
            Gb["VerticalAlignment"]=bd["Enum"]["VerticalAlignment"]["Center"]
            Gb["SortOrder"]=bd["Enum"]["SortOrder"]["LayoutOrder"]
            Gb["Padding"]=bd["UDim"]["new"](0,-94568/-23642)
            local nb=bd["Instance"]["new"]("UIScale",na)
            nb["Scale"]=3.9664961945797931e-05*24833
            local Wd=bd["Instance"]["new"](Va(-0.88680425265791119*6396))
            Wd["Name"]=Va(0.98770579431259353*-18708)
            Wd["LayoutOrder"]=Va(-0.48590276902390855*23799)
            Wd["Size"]=bd["UDim2"]["new"](Va(-498484980/-15364),Va(-1.9003100405437634*-20965),Va(69342-29087),0)
            Wd["BackgroundTransparency"]=Va(-42356+26632)
            Wd["Parent"]=na
            Wd["ZIndex"]=Va(11465+28374)
            local Zd=bd["Instance"]["new"](Va(289218260/9830),Wd)
            Zd["FillDirection"]=bd["Enum"]["FillDirection"]["Horizontal"]
            Zd["VerticalAlignment"]=bd["Enum"]["VerticalAlignment"]["Center"]
            Zd["HorizontalAlignment"]=bd["Enum"]["HorizontalAlignment"]["Left"]
            Zd["SortOrder"]=bd["Enum"]["SortOrder"]["LayoutOrder"]
            Zd["Padding"]=bd["UDim"]["new"](0,Va(1984- -7704))
            local Bd=bd["Instance"]["new"](Va(-237272450/-6514),Wd)
            Bd["Name"]=Va(-32181- -29351)
            Bd["LayoutOrder"]=-29596/-29596
            Bd["Size"]=bd["UDim2"]["new"](Va(944636642/30427),0,-21554- -21555,0)
            Bd["BackgroundTransparency"]=25837/25837
            Bd["Font"]=bd["Enum"]["Font"]["GothamBold"]
            Bd["TextColor3"]=bd["Color3"]["fromRGB"](Va(-286173492/-20526),Va(-14922-549),4031720/16456)
            Bd["Text"]=Va(-124455312/-5562)
            Bd["TextXAlignment"]=bd["Enum"]["TextXAlignment"]["Left"]
            Bd["TextScaled"]=Va(28951+-28214)
            Bd["TextTransparency"]=Va(-0.97972088966419535*-22930)
            Bd["AutomaticSize"]=bd["Enum"]["AutomaticSize"]["X"]
            Bd["ZIndex"]=Va(-0.3781670452559846*22892)
            local La=bd["Instance"]["new"](Va(-12775+14224),Wd)
            La["Name"]=Va(221135162/7262)
            La["LayoutOrder"]=Va(-0.11117637635499546*18727)
            La["Size"]=bd["UDim2"]["new"](Va(-240337008/21474),0,24999/24999,0)
            La["BackgroundTransparency"]=Va(0.77321874133629054*10821)
            La["Font"]=bd["Enum"]["Font"]["Gotham"]
            La["TextColor3"]=bd["Color3"]["fromRGB"](3156475/18037,-28935- -29110,-24415- -24600)
            La["Text"]="(TG_@YomkaMadeIt)"
            La["TextXAlignment"]=bd["Enum"]["TextXAlignment"]["Left"]
            La["TextScaled"]=Va(-3.4785867237687365*1868)
            La["TextSize"]=Va(-0.87207852068759828*-18441)
            La["TextTransparency"]=0.00015304560759106213*6534
            La["AutomaticSize"]=bd["Enum"]["AutomaticSize"]["X"]
            La["ZIndex"]=Va(-28975- -12706)
            local Wa=bd["Instance"]["new"](Va(37743+2079),na)
            Wa["Name"]=Va(26.73792093704246*-683)
            Wa["LayoutOrder"]=8510/4255
            Wa["Size"]=bd["UDim2"]["new"](Va(3735042/-1527),0,Va(1.7739130434782608*-3220),Va(340249608/7908))
            Wa["BackgroundTransparency"]=19218+-19217
            Wa["Font"]=bd["Enum"]["Font"]["GothamSemibold"]
            Wa["TextColor3"]=bd["Color3"]["fromRGB"](-3404940/-15477,Va(137488104/13338),528+-298)
            Wa["Text"]=Va(-35129- -29042)
            Wa["TextXAlignment"]=bd["Enum"]["TextXAlignment"]["Left"]
            Wa["TextScaled"]=true
            Wa["TextTransparency"]=Va(54270898/-13387)
            Wa["ZIndex"]=Va(-353614272/32736)
            local _d=bd["Instance"]["new"]("TextLabel",na)
            _d["Name"]="Status"
            _d["LayoutOrder"]=Va(3.9958784131890779*3882)
            _d["Size"]=bd["UDim2"]["new"](29366/29366,0,Va(29307-10746),0)
            _d["BackgroundTransparency"]=9.3773443360840213e-05*10664
            _d["Font"]=bd["Enum"]["Font"]["Gotham"]
            _d["TextColor3"]=bd["Color3"]["fromRGB"](14554-14354,-200/-1,0.01183855514564176*18161)
            _d["Text"]=Va(82744875/24517)
            _d["TextXAlignment"]=bd["Enum"]["TextXAlignment"]["Left"]
            _d["TextScaled"]=true
            _d["TextTransparency"]=19811-19810
            _d["ZIndex"]=Va(-0.43724354332609222*-24858)
            local Ea=bd["Instance"]["new"]("Frame")
            Ea["Name"]=Va(24190+14444)
            Ea["AnchorPoint"]=bd["Vector2"]["new"](-2.2017702232595007e-05*-22709,Va(461125524/-32412))
            Ea["Position"]=bd["UDim2"]["new"](Va(-4901+-405),Va(-370389210/22353),Va(45490-30113),Va(0.42012418273777707*-24319))
            Ea["Size"]=bd["UDim2"]["new"](Va(0.21716271061370065*32524),Va(-5268+9766),Va(117570530/7490),29904+-29897)
            Ea["BackgroundColor3"]=bd["Color3"]["fromRGB"](Va(31564-14691),-11544- -11574,Va(493271820/10947))
            Ea["BackgroundTransparency"]=Va(19106+-11563)
            Ea["BorderSizePixel"]=Va(15666+-11053)
            Ea["ZIndex"]=Va(1.2394755003450655*17388)
            Ea["Parent"]=Db
            local Ta=bd["Instance"]["new"](Va(2.4952614379084967*12240),Ea)
            Ta["CornerRadius"]=bd["UDim"]["new"](Va(66337-32717),Va(115247160/9628))
            local Qc=bd["Instance"]["new"](Va(58573-30746),Ea)
            Qc["Size"]=bd["UDim2"]["new"](0,Va(732061148/27937),-21521- -21522,0)
            Qc["BackgroundColor3"]=bd["Color3"]["fromRGB"](Va(-359457960/28120),-20985+21185,Va(0.85757360766229163*16914))
            Qc["BorderSizePixel"]=Va(-8189- -28549)
            local vc=bd["Instance"]["new"](Va(301272634/13403),Qc)
            vc["CornerRadius"]=bd["UDim"]["new"](0,Va(23812- -15180))
            local pa=bd["Instance"]["new"]("UIGradient",Qc)
            pa["Color"]=bd["ColorSequence"]["new"]({bd["ColorSequenceKeypoint"]["new"](Va(12531+5835),bd["Color3"]["fromRGB"](-28965+29125,Va(64841+-20098),-22289- -22544)),bd["ColorSequenceKeypoint"]["new"](Va(0.51996622628389788*-20134),bd["Color3"]["fromRGB"](-417180/-1636,Va(-3637+-3229),32030+-31775)),bd["ColorSequenceKeypoint"]["new"](-0.00010863661053775122*-9205,bd["Color3"]["fromRGB"](3229120/20182,Va(215824800/11400),Va(125957308/7619)))})
            pa["Transparency"]=bd["NumberSequence"]["new"](0)
            pa["Offset"]=bd["Vector2"]["new"](Va(1.4143011737284608*24026),0)
            local function wb()
                return(function(Rc)
                    local function j(od)
                        return Rc[od+(-12781-188)]
                    end;
                    nb["Scale"]=j(-177+30839);
                    Nc:Create(Bd,bd["TweenInfo"]["new"](j(-1.6705436840681633*3697),bd["Enum"]["EasingStyle"]["Quad"],bd["Enum"]["EasingDirection"]["Out"]),{[j(0.12780627949928175*24365)]=0}):Play();
                    Nc:Create(La,bd["TweenInfo"]["new"](j(-108081945/-19527),bd["Enum"]["EasingStyle"]["Quad"],bd["Enum"]["EasingDirection"]["Out"]),{["TextTransparency"]=j(-36073+24446)}):Play();
                    Nc:Create(Wa,bd["TweenInfo"]["new"](-923.39999999999998/-2565,bd["Enum"]["EasingStyle"]["Quad"],bd["Enum"]["EasingDirection"]["Out"]),{[j(-35055- -31168)]=j(-15850+31909)}):Play();
                    Nc:Create(_d,bd["TweenInfo"]["new"](j(-34688475/-5105),bd["Enum"]["EasingStyle"]["Quad"],bd["Enum"]["EasingDirection"]["Out"]),{[j(-293140956/-30909)]=0}):Play();
                    Nc:Create(nb,bd["TweenInfo"]["new"](1.4599428189062595e-05*16439,bd["Enum"]["EasingStyle"]["Back"],bd["Enum"]["EasingDirection"]["Out"]),{["Scale"]=11074.139999999999/10857}):Play();
                    bd["task"]["delay"](j(60529+-24385),function()
                        return(function(ja)
                            local function e(fb)
                                return ja[fb+(-10826+-18257)]
                            end;
                            Nc:Create(nb,bd["TweenInfo"]["new"](-2651/-13255,bd["Enum"]["EasingStyle"]["Sine"],bd["Enum"]["EasingDirection"]["In"]),{[e(-24884+29509)]=15802-15801}):Play()
                        end)({[1.411391309365803*-17329]="Scale"})
                    end)
                end)({[-48615+29470]=10146.15/28989,[-0.18318709983400522*-16868]=0,[-21730- -11875]="TextTransparency",[-28064925/-1211]=3838.5599999999999/15994,[-36579- -11983]=0,[-0.32611451510669764*18932]=2.7173913043478262e-05*13984,[7775-24631]="TextTransparency",[12086- -5607]=-7203/-7350,[-178386264/23996]=-1.828432119457565e-05*-19689,[-0.16372263459550879*21286]="TextTransparency"})
            end
            local function uc(gb)
                return(function(n)
                    local function qa(oc)
                        return n[oc+(4389-25116)]
                    end;
                    gb=gb or 7934.3600000000006/28337
                    local Lb=bd["TweenInfo"]["new"](gb,bd["Enum"]["EasingStyle"]["Quad"],bd["Enum"]["EasingDirection"]["In"])
                    local Ic,Uc,Dd,Vd,w=Nc:Create(Bd,Lb,{[qa(-13336017/-421)]=30504-30503}),Nc:Create(La,Lb,{["TextTransparency"]=-26797- -26798}),Nc:Create(Wa,Lb,{[qa(13844+-3301)]=qa(0.51881464094476637*27266)}),Nc:Create(_d,Lb,{[qa(71194+-29445)]=-23220/-23220}),Nc:Create(nb,bd["TweenInfo"]["new"](gb,bd["Enum"]["EasingStyle"]["Quad"],bd["Enum"]["EasingDirection"]["In"]),{[qa(-9910- -12830)]=qa(-6155+29003)});
                    Ic:Play();
                    Uc:Play();
                    Dd:Play();
                    Vd:Play();
                    w:Play()
                    return{Ic,Uc,Dd,Vd,w}
                end)({[0.28827368697709055*-22829]=-13310+13311,[-31236- -13429]="Scale",[3.7619899785254116*5588]="TextTransparency",[0.30465383510485494*6962]=-5.1862828111769688e-05*-18896,[1.6102941176470589*6800]="TextTransparency",[-21803+11619]="TextTransparency"})
            end
            local function ra(Ja)
                return(function(cd)
                    local function yd(Tc)
                        return cd[Tc+(-3625- -11981)]
                    end;
                    local Kb=(bd["tostring"](Ja)=="✅")or(bd["tostring"](Ja):lower()=="success")
                    local N,Aa=Kb and Dc or ha,Kb and ha or Dc
                    if not(not Kb)then
                    else
                        ha["Image"]=yd(-19842+-8440)
                    end
                    if not(Aa:IsA(yd((-24018- -25754)+-62675165/-25655)))then
                        Nc:Create(Aa,bd["TweenInfo"]["new"](yd(-642000798/15733)),{["TextTransparency"]=4127/4127}):Play()
                    else
                        Nc:Create(Aa,bd["TweenInfo"]["new"](-2754.2400000000002/-17214),{["ImageTransparency"]=yd(-3.301187732671512*5641)}):Play()
                    end;
                    bd["task"]["wait"](yd(-261906018/-20561))
                    if not(N:IsA(yd((47358.34439716312/25309)*(-6485- -13535))))then
                        Nc:Create(N,bd["TweenInfo"]["new"](yd(1.3764093668690374*12683),bd["Enum"]["EasingStyle"]["Quad"],bd["Enum"]["EasingDirection"]["Out"]),{[yd(21322+-19716)]=0}):Play()
                    else
                        Nc:Create(N,bd["TweenInfo"]["new"](2.0786092214663643e-05*10584,bd["Enum"]["EasingStyle"]["Quad"],bd["Enum"]["EasingDirection"]["Out"]),{["ImageTransparency"]=0}):Play()
                    end
                end)({[-4389-28061]=5.5022524846108876e-06*29079,[-1159+13694]="ImageLabel",[188142332/18886]="TextTransparency",[1028- -24785]=-6311.5799999999999/-28689,[-456796052/-21199]="ImageLabel",[-9329- -30423]=-5.1942655308539376e-06*-9626,[-39366- -29100]=-10113+10114,[-9631-10295]="rbxassetid://82898985676372"})
            end
            local tc=Va(54988+-27401)
            local function tb()
                if tc then
                    return
                end
                tc=true;
                bd["pcall"](function()
                    return(function(Ha)
                        local function bb(nc)
                            return Ha[nc-0.89602501926301958*22063]
                        end;
                        local Sd=Nc:Create(Ua,bd["TweenInfo"]["new"](bb(7370634/-26137),bd["Enum"]["EasingStyle"]["Quad"],bd["Enum"]["EasingDirection"]["Out"]),{[bb(0.98842094476893128*-9759)]=bb(422- -3897)});
                        Sd:Play()
                    end)({[-4035+-16016]=-0.0001191806331471136*-2685,[-52458+23043]="BackgroundTransparency",[-41146+25696]=-4690.3400000000001/-12343})
                end);
                bd["task"]["spawn"](function()
                    while tc do
                        if not(Zb)then
                            bd["task"]["wait"](15636+-15635)
                        else
                            Nc:Create(Zb,bd["TweenInfo"]["new"](12996+-12995,bd["Enum"]["EasingStyle"]["Sine"],bd["Enum"]["EasingDirection"]["Out"]),{["Size"]=5978-5942}):Play();
                            bd["task"]["wait"](-9488/-9488);
                            Nc:Create(Zb,bd["TweenInfo"]["new"](-16256/-16256,bd["Enum"]["EasingStyle"]["Sine"],bd["Enum"]["EasingDirection"]["In"]),{["Size"]=30869+-30841}):Play();
                            bd["task"]["wait"](-3.3142213236999966e-05*-30173)
                        end
                    end
                end);
                bd["task"]["spawn"](function()
                    return(function(aa)
                        local function Oa(Ga)
                            return aa[Ga+-166886271/14643]
                        end;
                        while tc do
                            Nc:Create(ub,bd["TweenInfo"]["new"](1453.5/1615,bd["Enum"]["EasingStyle"]["Sine"],bd["Enum"]["EasingDirection"]["Out"]),{["Scale"]=Oa(-123093440/-19330)}):Play();
                            bd["task"]["wait"](-24133.5/-26815);
                            Nc:Create(ub,bd["TweenInfo"]["new"](-25066.799999999999/-27852,bd["Enum"]["EasingStyle"]["Sine"],bd["Enum"]["EasingDirection"]["In"]),{["Scale"]=-27355+27356}):Play();
                            bd["task"]["wait"](7483.5/8315)
                        end
                    end)({[-146851829/29201]=4023.1249999999995/3925})
                end);
                bd["task"]["spawn"](function()
                    return(function(ec)
                        local function ed(xd)
                            return ec[xd- -501750043/19247]
                        end;
                        while tc do
                            pa["Offset"]=bd["Vector2"]["new"](ed(-0.43616461928206107*20921),ed(11596+-9335));
                            Nc:Create(pa,bd["TweenInfo"]["new"](26704.799999999999/29672,bd["Enum"]["EasingStyle"]["Linear"]),{["Offset"]=bd["Vector2"]["new"](ed(1.3422857142857143*-26250),0)}):Play();
                            bd["task"]["wait"](-8.4057158868030261e-05*-10707)
                        end
                    end)({[-33970+24804]=13502+-13501,[20555+-3611]=26747-26748,[16424- -11906]=0})
                end)
            end
            local function c()
                return(function(jd)
                    local function gd(h)
                        return jd[h+(-6673- -9267)]
                    end;
                    tc=gd(-0.81546100738019933*-29403);
                    bd["pcall"](function()
                        return(function(E)
                            local function I(T)
                                return E[T- -51183496/-2947]
                            end;
                            local ka=Nc:Create(Ua,bd["TweenInfo"]["new"](I(289470631/12091),bd["Enum"]["EasingStyle"]["Quad"],bd["Enum"]["EasingDirection"]["Out"]),{["BackgroundTransparency"]=I(0.42843665020256394*-18019)});
                            ka:Play();
                            Nc:Create(ub,bd["TweenInfo"]["new"](I(3.5949837436135623*4306)),{[I(360298680/9384)]=I(-1315- -25208)}):Play()
                            if Zb then
                                Nc:Create(Zb,bd["TweenInfo"]["new"](-3716.75- -3717),{[I(28162+-23043)]=-0.001755595962129287*-15949}):Play()
                            end
                            pa["Offset"]=bd["Vector2"]["new"](I(-7704+3387),0)
                        end)({[26788398/1274]="Scale",[-20658+27231]=21107.25+-21107,[18.581833761782349*-1167]=-0.00012036591237361579*8308,[28279350/4334]=9123/9123,[-0.13375841303577754*14115]=3.1875557822261888e-05*7843,[-0.39506531204644413*31005]="Size",[-42659+17571]=-4819.9200000000001/-12684})
                    end)
                end)({[29313+-2742]=false})
            end
            local function Yd(zd)
                return(function(_e)
                    local function jb(Gd)
                        return _e[Gd-(-13071-13472)]
                    end;
                    zd=bd["math"]["clamp"](bd["tonumber"](zd)or 30934-30902,jb(-67156+23501),jb(14.034615384615385*-3120))
                    local kb=bd["Vector2"]["new"](Db["AbsolutePosition"]["X"]+Db["AbsoluteSize"]["X"]/(7951+-7949),Db["AbsolutePosition"]["Y"]+Db["AbsoluteSize"]["Y"]/jb(-284+-24977))
                    for Pa=jb(-868447125/32435),zd do
                        bd["task"]["spawn"](function()
                            return(function(Ud)
                                local function Td(ld)
                                    return Ud[ld-(17696-5437)]
                                end;
                                local b=bd["Instance"]["new"]("Frame")
                                b["Size"]=bd["UDim2"]["fromOffset"](0.00019692792437967703*25390,Td(27273+-23504))
                                b["BackgroundColor3"]=bd["Color3"]["fromHSV"]((Pa*Td(337260302/30161)+bd["math"]["random"]())%Td(24643+10075),Td(23016+-31746),-37- -38)
                                b["BorderSizePixel"]=0
                                b["AnchorPoint"]=bd["Vector2"]["new"](6.6137566137566142e-05*7560,11417.5-11417)
                                b["Position"]=bd["UDim2"]["fromOffset"](kb["X"]+bd["math"]["random"](Td(22190+-30307),Td(-34650+19444)),kb["Y"]+bd["math"]["random"](11768-11776,0.00036742754788040232*21773))
                                b["BackgroundTransparency"]=Td(-1.9763284495954516*-18292)
                                b["Parent"]=Hd
                                local fd=bd["Instance"]["new"]("UICorner",b)
                                fd["CornerRadius"]=bd["UDim"]["new"](18250-18249,0)
                                local Bc,sc,Fd=bd["math"]["random"](-26571- -26411,Td(-36.585106382978722*-188)),bd["math"]["random"](1362000/13620,0.0076263107721639654*26225),bd["math"]["random"](Td(-259- -21607),Td(1.6826603522765038*24072))/(20481+-20381)
                                local Ad=Nc:Create(b,bd["TweenInfo"]["new"](Fd,bd["Enum"]["EasingStyle"]["Quad"],bd["Enum"]["EasingDirection"]["Out"]),{[Td(-0.29567126519644787*-30517)]=bd["UDim2"]["fromOffset"](kb["X"]+Bc,kb["Y"]+sc),["BackgroundTransparency"]=Td(-17197+17192)});
                                Ad:Play();
                                bd["task"]["wait"](Fd*Td(50866+-20276));
                                Nc:Create(b,bd["TweenInfo"]["new"](Fd*(-1.0182953735446862e-05*-29461)),{[Td(55990+-28391)]=0.00024888003982080636*4018}):Play();
                                bd["task"]["wait"](Fd*Td(-8353- -20440));
                                b:Destroy()
                            end)({[-13855-13610]=-5110- -5146,[2.4098779449332954*-3523]=-155255/-31051,[50790-26898]=0,[10537-30913]=0.0021195172210774211*-16985,[72577008/-22428]="Position",[20+28226]=9996-9886,[-19264/112]=9843.75/28125,[536835653/-25577]=18081/20090,[-9621+32080]=-4049+4050,[-416189540/-27131]="BackgroundTransparency",[-4.8303411131059244*1114]=6489+-6329,[-5796- -4719]=-1266.8800000000001/-15836,[-522818451/-28521]=-14318.5/-20455,[-22122- -31211]=29584-29514,[-14634- -2370]=3102/12408})
                        end)
                    end
                end)({[-11421- -12703]=3943+-3941,[-13819-3426]=-19455+19575,[-2.8944519621109608*5912]=-308748/-25729,[3063-3295]=-21422+21423})
            end
            local function md()
                return(function(Hc)
                    local function xb(ae)
                        return Hc[ae- -146430676/8302]
                    end;
                    c()
                    f["Color"]=bd["Color3"]["fromRGB"](xb(0.24669286182056319*15270),-0.024592535442183431*-10369,-2329200/-12940)
                    f["Transparency"]=xb(387263625/-23795);
                    Nc:Create(f,bd["TweenInfo"]["new"](-4717.6800000000003/-21444,bd["Enum"]["EasingStyle"]["Quad"],bd["Enum"]["EasingDirection"]["Out"]),{[xb(-132706320/6670)]=0.00029868578255675028*10044}):Play();
                    Nc:Create(f,bd["TweenInfo"]["new"](xb(45057068/-7927),bd["Enum"]["EasingStyle"]["Quad"],bd["Enum"]["EasingDirection"]["In"]),{[xb(-10915+10854)]=xb(-46734+1562)}):Play()
                    if P then
                        P["Enabled"]=xb(-30136-18132)
                    end;
                    Nc:Create(P,bd["TweenInfo"]["new"](3397.5/18875),{[xb(55357175/-25475)]=-0.00016032492518170159*-9356,[xb(11072-25829)]=-0.0014388489208633094*-16680}):Play();
                    bd["task"]["delay"](-4.7421458209839956e-05*-6748,function()
                        return(function(Kc)
                            local function W(_b)
                                return Kc[_b-(8628-22035)]
                            end;
                            if P then
                                Nc:Create(P,bd["TweenInfo"]["new"](-4516.96/-16132),{["Intensity"]=0,[W(-1198-1011)]=464-456}):Play()
                            end;
                            bd["task"]["delay"](W(-14840+-5099),function()
                                return(function(G)
                                    local function da(ta)
                                        return G[ta+-27189171/3383]
                                    end;
                                    if not(P)then
                                    else
                                        P["Enabled"]=da(18943+-27297)
                                    end
                                end)({[-8278-8113]=false})
                            end)
                        end)({[7863+3335]="Size",[-6078-454]=1.3461969934933811e-05*22285})
                    end);
                    Nc:Create(ub,bd["TweenInfo"]["new"](-1.8377746220031744e-05*-11971,bd["Enum"]["EasingStyle"]["Back"],bd["Enum"]["EasingDirection"]["Out"]),{["Scale"]=-6.7992302758178319e-05*-15590}):Play();
                    Nc:Create(ub,bd["TweenInfo"]["new"](xb(17518+-24061),bd["Enum"]["EasingStyle"]["Sine"],bd["Enum"]["EasingDirection"]["In"]),{["Scale"]=-4387/-4387}):Play();
                    Yd(xb(0.83732278018980288*-26027))
                end)({[-11571- -14452]="Size",[-1.7180831149382254*16026]=0,[-0.21611791730474733*10448]="Thickness",[-16317-14313]=true,[17982-22137]=6373+-6337,[19876- -1529]=-18068- -18188,[-12445- -27910]="Intensity",[36885+-24931]=7814.7999999999993/22328,[1.4356884057971016*7728]=0.00034146341463414637*820,[23779+-22416]=-0.00019305019305019305*-2072,[16474+1103]="Thickness"})
            end
            local function ca()
                return(function(S)
                    local function hb(wc)
                        return S[wc+(13148-29078)]
                    end;
                    c()
                    f["Color"]=bd["Color3"]["fromRGB"](0.019815059445178335*12869,-11146+11266,hb(3822+8814))
                    f["Transparency"]=6486/21620;
                    Nc:Create(f,bd["TweenInfo"]["new"](7.7323573380071133e-06*19399),{["Thickness"]=hb(-0.048561094511715676*-31795)}):Play();
                    bd["task"]["delay"](hb(1.1327550787491441*21905),function()
                        return(function(p)
                            local function Yb(Wc)
                                return p[Wc+-0.096019604930937169*-26932]
                            end;
                            Nc:Create(f,bd["TweenInfo"]["new"](Yb(-18941+24989)),{["Thickness"]=Yb(-24381- -20038),["Transparency"]=Yb(63049097/5987)}):Play()
                        end)({[165954114/19221]=-1.3647642679900744e-05*-16120,[13486+-15243]=0,[17436-4319]=-18506.399999999998/-30844})
                    end);
                    bd["task"]["spawn"](function()
                        return(function(fa)
                            local function qd(ua)
                                return fa[ua+(24851+-6749)]
                            end;
                            local kc=Db["Position"]
                            local Mc={bd["UDim2"]["new"](-29127.5+29128,6686-6678,24742.5+-24742,qd(-908-8518)),bd["UDim2"]["new"](qd(23688+-26908),-62104/7763,qd(11846+-25676),qd(1.5077937649880095*-1668)),bd["UDim2"]["new"](qd(5.7068331143232589*-7610),qd(-1.9240616455381556*8046),qd(-23626-15907),qd(-0.8955261364044057*27873)),bd["UDim2"]["new"](qd(-36592- -26767),164022/-27337,-17878.5+17879,0),bd["UDim2"]["new"](qd(-45028+-3352),15382-15379,qd(9454+-31171),0),bd["UDim2"]["new"](12498.5/24997,15597+-15600,qd(-1012+-28054),qd(352256352/-10716)),kc}
                            for Ab,sa in bd["ipairs"](Mc)do
                                Nc:Create(Db,bd["TweenInfo"]["new"](qd(-207415752/10501)),{["Position"]=sa}):Play();
                                bd["task"]["wait"](qd(-14160+-28039))
                            end
                        end)({[371934952/-12284]=10970.5/21941,[-0.18563637651391743*-14119]=13007+-13001,[-23945- -17086]=0,[-437649856/-29408]=15675.5+-15675,[32526-16939]=0,[4989+-717]=-14588.5- -14589,[-0.057858194824321481*28518]=-1.0436234606553956e-05*-4791,[-43915+29145]=0,[-48253+22926]=7156/14312,[-2182+-19249]=-30735.5+30736,[0.42032847245772975*20641]=0,[-1896+-1719]=-11788.5+11789,[-320357116/29219]=-3479/-6958,[-34781+10684]=1.8937959245511705e-06*26402,[17482+-9205]=-12190.5/-24381})
                    end)
                end)({[-44004+29618]=-26436/-6609,[-209558853/-23591]=8.9869281045751639e-06*24480,[97479342/-29593]=-3150840/-26257})
            end;
            bd["task"]["spawn"](function()
                return(function(Sc)
                    local function Id(Qd)
                        return Sc[Qd+-398986210/17246]
                    end;
                    if not(Zb)then
                    else
                        Nc:Create(Zb,bd["TweenInfo"]["new"](4093.6500000000001/9097,bd["Enum"]["EasingStyle"]["Quint"],bd["Enum"]["EasingDirection"]["Out"]),{["Size"]=Id(1.0786935922852054*29761)}):Play()
                    end;
                    Nc:Create(Ua,bd["TweenInfo"]["new"](7175.25/15945,bd["Enum"]["EasingStyle"]["Quad"],bd["Enum"]["EasingDirection"]["Out"]),{[Id(74302+-22285)]=Id(74416+-27189)}):Play();
                    bd["task"]["wait"](-3.713445768219093e-06*-32315);
                    wb();
                    Nc:Create(ha,bd["TweenInfo"]["new"](Id(1658383473/30209),bd["Enum"]["EasingStyle"]["Quad"],bd["Enum"]["EasingDirection"]["Out"]),{["ImageTransparency"]=0}):Play();
                    Nc:Create(Ea,bd["TweenInfo"]["new"](Id(259768782/16569)),{["BackgroundTransparency"]=-1.4742014742014742e-05*-30525}):Play()
                end)({[54068+-22306]=4078.7999999999997/11330,[-45905292/6156]=-1.3277763434514807e-05*-27113,[-555.42307692307691*-52]="BackgroundTransparency",[-5555- -14523]=-24639+24667,[33460+-9368]=0.00037810945273631839*1005})
            end)
            local function Ib(vb)
                return(function(Zc)
                    local function Vb(i)
                        return Zc[i+(-55441+32138)]
                    end;
                    if not(Wa and Wa[D("Uì¡Zê","Ä4")])then
                    else
                        Wa["Text"]=bd["tostring"](vb)
                        if Wa["TextTransparency"]>=-3.3722263438321979e-05*-29654 then
                            Nc:Create(Wa,bd["TweenInfo"]["new"](Vb(1.1460979419955173*29446)),{[Vb(0.99127016963177494*24170)]=0}):Play()
                        end
                    end
                end)({[-26048- -26704]="TextTransparency",[200188870/19166]=1.2609704428528195e-05*19826})
            end
            local function eb(Na,q)
                if not(_d and _d[D("[VnP","ì$")])then
                else
                    _d["Text"]=bd["tostring"](Na)
                    if q then
                        _d["TextColor3"]=q
                    end
                    if not(_d[D("¿X
k÷ý}¡MmÆá¶","ë=r£Ï")]>=-397477240/19060+644836600/30920)then
                    else
                        Nc:Create(_d,bd["TweenInfo"]["new"](0.00016160310277957336*1547),{["TextTransparency"]=0}):Play()
                    end
                end
            end
            local function sb(U)
                return(function(Ma)
                    local function Tb(y)
                        return Ma[y-(13379-15440)]
                    end;
                    local Gc=bd["math"]["clamp"](bd["tonumber"](U)or Tb(21825-1823),0,Tb(12527+-26937));
                    Nc:Create(Qc,bd["TweenInfo"]["new"](-3.3432835820895528e-05*-8375,bd["Enum"]["EasingStyle"]["Cubic"]),{[Tb(-90431913/-10803)]=bd["UDim2"]["new"](Gc,Tb(-1.2730940312403021*-9667),Tb(-0.63964971838592699*25922),0)}):Play()
                end)({[16957+-2589]=0,[-270898176/-25968]="Size",[-39985+25465]=-0.001639344262295082*-610,[-510802576/-23152]=0,[0.72102528171892333*-17127]=8765-8764})
            end
            local function rc(ea)
                ra(ea)
            end
            local function ga(Da)
                return(function(Mb)
                    local function Bb(Jc)
                        return Mb[Jc+-1.6557823129251701*3675]
                    end;
                    if Da then
                        sb(3.661662394727206e-05*27310);
                        eb(Bb(-0.40441784964033356*15709),bd["Color3"]["fromRGB"](0.023185717597959656*4313,-5553+5808,-13446- -13596));
                        ra(Bb(9882+-29562))
                    end;
                    bd["task"]["wait"](Bb(-34995104/20066))
                    local u,X=bd["TweenInfo"]["new"](-5359.1999999999998/-12180,bd["Enum"]["EasingStyle"]["Quad"],bd["Enum"]["EasingDirection"]["In"]),{};
                    bd["table"]["insert"](X,Nc:Create(Bd,u,{[Bb(-0.83611865468978486*19148)]=Bb(-40444+15664)}));
                    bd["table"]["insert"](X,Nc:Create(La,u,{["TextTransparency"]=Bb(-1.1013775290572536*23230)}));
                    bd["table"]["insert"](X,Nc:Create(Wa,u,{["TextTransparency"]=Bb(-1.8030078895463511*-4056)}));
                    bd["table"]["insert"](X,Nc:Create(_d,u,{[Bb(-2738-2046)]=-5932/-5932}));
                    bd["table"]["insert"](X,Nc:Create(ha,u,{[Bb(-3721-20806)]=-19828- -19829}));
                    bd["table"]["insert"](X,Nc:Create(Dc,u,{["TextTransparency"]=3650/3650}));
                    bd["table"]["insert"](X,Nc:Create(Ea,u,{["BackgroundTransparency"]=Bb(-3.7360119047619049*-6720)}));
                    bd["table"]["insert"](X,Nc:Create(Ua,u,{["BackgroundTransparency"]=20873/20873}));
                    bd["table"]["insert"](X,Nc:Create(Db,u,{["Size"]=bd["UDim2"]["new"](Bb(18116+-12405),0,Bb(0.30669161543259377*-22446),Bb(206231022/-11727)),[Bb(-43517+30302)]=Bb(0.69061612112248472*-25693)}))
                    if Zb then
                        bd["table"]["insert"](X,Nc:Create(Zb,u,{["Size"]=0}))
                    end;
                    bd["table"]["insert"](X,Nc:Create(nb,u,{[Bb(134129930/-6061)]=-0.00043855641845591591*-2189}))
                    for ib,Nb in bd["ipairs"](X)do
                        Nb:Play()
                    end
                    if#X>Bb(-367149776/28532)then
                        bd["pcall"](function()
                            X[26480+-26479]["Completed"]:Wait()
                        end)
                    else
                        bd["task"]["wait"](-1.3489484333803421e-05*-32618)
                    end;
                    bd["pcall"](function()
                        if Hd and Hd["Parent"]then
                            Hd:Destroy()
                        end
                        if not(Zb)then
                        else
                            Zb:Destroy()
                        end
                        if not(Ob)then
                        else
                            Ob:Destroy()
                        end
                        if not(P)then
                        else
                            P:Destroy()
                        end
                    end)
                end)({[-367+-21728]="TextTransparency",[-51671400/6600]=8987.3999999999996/14979,[-41213+30344]="TextTransparency",[356934591/-14979]=-18365- -18366,[-44622- -14010]="ImageTransparency",[-1.7471951579568941*13548]=0,[-36258+23289]=1.0057471264367816e-05*13920,[-221100104/-11624]=-8647+8648,[-0.040154339153750572*-30582]=-28335+28336,[9653-28953]="BackgroundTransparency",[9814508/-26242]=1.1532177979946823e-05*31217,[1.3987854251012146*-8892]="Loaded Successfully!",[-3.340031112263417*7714]="✅",[-60722+29857]=-23008+23009,[1.2968346914540765*-24421]=-28385+28386,[95056335/-3369]="Scale",[-599142236/31612]=0})
            end
            local function Vc()
                return(function(g)
                    local function ia(k)
                        return g[k-(-25143- -20677)]
                    end;
                    local Xc=bd["workspace"]["CurrentCamera"]
                    if not(not Xc)then
                    else
                        return
                    end
                    local kd,m=Xc["ViewportSize"]["X"],Xc["ViewportSize"]["Y"]
                    if kd==ia(26059+-7615)or m==ia(726722220/32647)then
                        return
                    end
                    local hd,C,H=bd["math"]["floor"](kd*(-6.2905445252604678e-05*-15261)),bd["math"]["floor"](m*(3.9903489235337789e-05*21552)),(kd<=-7265- -7685)
                    local oa,L=bd["math"]["clamp"](bd["math"]["floor"](kd*(H and 5.8783321941216676e-05*14630 or ia(-17934- -25008))),ia(-2325- -1509),hd),bd["math"]["clamp"](bd["math"]["floor"](m*(H and-5.5845122859270285e-06*-32232 or ia(29303+-9497))),664928/7556,bd["math"]["floor"](m*ia(3245-17391)))
                    Db["Size"]=bd["UDim2"]["new"](0,oa,ia(-0.17744727730563425*-12708),L)
                    Db["Position"]=bd["UDim2"]["new"](10765/21530,ia(-2.0261377093554391*11822),14927.5+-14927,0)
                    local pc=H and 13855.76/22348 or ia(-28199+30427)
                    local v=bd["math"]["clamp"](bd["math"]["floor"](L*pc),-27426- -27474,bd["math"]["floor"](L*(-5.501895097200147e-05*-16358)))
                    qc["Size"]=bd["UDim2"]["new"](ia(-0.96633722226350593*-13457),v,0,v)
                    local Fc=oa-v-ia(-1012347003/31281)
                    if Fc<2747220/19623 then
                        Fc=-16581- -16721
                    end
                    na["Size"]=bd["UDim2"]["new"](ia(0.190410171440165*29573),Fc,ia(-29176- -19706),v)
                    Ea["Size"]=bd["UDim2"]["new"](0,bd["math"]["clamp"](oa*(2.8112700693446619e-05*32014),-26144+26264,oa),0,ia(-29475- -19704))
                    Ea["Position"]=bd["UDim2"]["new"](-26388.5- -26389,ia(-34277- -9771),31965/31965,2292+-2282)
                    if H then
                        Bd["TextScaled"]=true
                        Wa["TextScaled"]=true
                        _d["TextScaled"]=ia(-0.33351552954793906*31102)
                        nb["Scale"]=-28086.799999999999/-28660
                        La["TextSize"]=0.00049534727382089655*28263
                    else
                        nb["Scale"]=-5.5709518692381653e-05*-17681
                        La["TextSize"]=15391-15373
                    end
                end)({[-5.7155688622754495*-4676]=0,[56730-32458]=5493.6000000000004/27468,[7100+-13007]=true,[185546240/-19168]=-0.00012300810735253005*-3577,[-0.7091561938958707*-32306]=0,[-4416- -21886]=0,[-111580065/21033]=-0.00040392383150605887*-17330,[-0.35230186835999511*-32756]=-0.00018538324420677363*-2805,[-0.12431456694254282*-29361]=17201+-16941,[0.7147550349950007*-7001]=0,[-5796+12517]=0,[0.85428082942440053*-22811]=0,[-22987- -29681]=0.0001017146178436501*6882,[863272665/-30945]=1414+-1378,[-1547+-18493]=0,[-10651+20748]=0})
            end;
            Vc()
            local id=bd["workspace"]["CurrentCamera"]
            if not(id)then
            else
                id:GetPropertyChangedSignal("ViewportSize"):Connect(function()
                    Vc()
                end)
            end;
            Hd["Changed"]:Connect(function()
                Vc()
            end)
            return{["Root"]=Hd,[Va(-50522266/-17903)]=Ib,[Va(-1019044800/-32400)]=eb,[Va(4429- -21756)]=sb,[Va(723502283/26887)]=rc,["Hide"]=ga,["StartLoadingEffects"]=tb,[Va(-33447+15289)]=c,["SuccessEffects"]=md,["ErrorEffects"]=ca,[Va(-1270573913/-29687)]={[Va(-13208-5963)]=Db,[Va(36920+-10280)]=Zb,["Overlay"]=Ua}}
        end)({[-0.24331494057724959*-9424]=28495-28492,[345964025/-18275]=-2.0765556863016543e-05*-14447,[-19960+4659]=-11864/-5932,[-622+18449]=0,[-144937188/9801]=-12173- -12175,[5948-27598]=654.84000000000003/-32742,[12.267729083665339*-1255]="UIListLayout",[-1050+4363]=-10177+10432,[-15854747/-2069]=0,[164425386/-13173]=true,[-48726- -22724]=-240900/-2409,[-41348+11559]=0,[-0.11847975764252272*18155]="Frame",[-15608+29029]="Blur",[-21399- -1682]=false,[-17246- -10190]="Frame",[-2045+28666]=0,[151906944/-6944]=-567+572,[2.1047388643802476*14054]="_Internal",[44093812/-20858]=22127.699999999997/31611,[65373048/2418]=-1.9182352235942931e-05*-25023,[1860+-21945]=21701+-21446,[24520320/-4320]=-2.5302220972729829e-05*-17785,[523197966/19542]="BlurEffect",[24137+-14891]=-17186+17187,[237961206/-27286]=0,[-33753+23356]="SetSubtitle",[-0.59936561367167274*-15448]="UICorner",[0.29473939982991132*-16462]=4.6544100535257155e-05*21485,[55543-28324]=0,[42179076/11772]=true,[590483763/-18819]="StopLoadingEffects",[333862815/20605]="UIListLayout",[-3434- -523]=0.0073135866493800076*30081,[49672-30446]=-8.5506626763574178e-05*-11695,[-44299- -14640]="IconFrame",[-3626-9996]=25601+-25346,[377652570/11874]=0,[-76207200/5650]=true,[25500+-15474]=-0.00022202486678507994*-4504,[0.17613690082253947*-10577]=26974+-26973,[0.094431328982085824*21603]="✅",[18504+-17781]=-10454- -10699,[300222312/-30498]="Please wait...",[-25355- -27833]=0,[-19671+-9817]=-19915+19920,[1.0210109998764059*-24273]=13602+-13601,[0.81101068200493021*-29208]=1248/2496,[0.27387582344142825*-31423]=0,[-44139- -31996]=0,[93039402/2922]=-412488/-11458,[-27972+20487]="BloomEffect",[175195134/-9274]="Frame",[224091909/-9329]=115110/23022,[19065+11997]=0,[-0.23028798090876842*-31009]=0,[0.096801686628089537*22293]=-4.4238000442380005e-05*-22605,[58966+-29245]=9941-9940,[-34764- -32414]=-36575/-7315,[-206414190/11595]=-3.6591166892312195e-05*-27329,[201637140/22020]="YOXI HUB",[7218+-24581]="ColorCorrectionEffect",[-52843- -25397]=-29052+29053,[77987910/6006]=0,[-9294- -2168]=0,[-688- -6401]=851400/3870,[-13413+-7974]=9135/9135,[3.7862620329580681*6129]="TextLabel",[260- -3371]=894450/5963,[-14504+29112]="Frame",[-86148062/3367]="rbxassetid://82898985676372",[-33380- -21610]="TextLabel",[45246-18643]="TextLabel",[-296021505/18897]=-12170- -12171,[40408-26040]=false,[5926+12307]="SetStatus",[33835+-30181]=-0.0039619651347068147*-7572,[-678+-24527]="Frame",[1.6718019257221457*-14540]=0,[-651351912/32226]=-0.00050018757033887707*-7997,[-174389353/15583]="CoreGui",[32718412/25442]=2.65625*96,[-78393957/-15231]=0,[43457-11933]=968660/4403,[-46893361/-2707]="UICorner",[0.12524964336661912*24535]=0.00014925373134328358*3350,[270846774/20889]="SetProgress",[24016- -1227]=-16500- -16502,[-315276099/10893]=-0.00036656891495601173*-2728,[13077+-29126]="Title",[-0.26893293722300687*20533]="UICorner",[-15880+9724]=-19961.459999999999/-23211,[-31017+-464]="Subtitle",[-1.1553469661414684*-14915]="TitleTag",[45621-19848]=180594/30099,[-24355-8035]="Container",[55973+-26166]=0,[-0.202083214101757*17473]=23631-23625,[2.7254671178461085*-6797]=-8197/-16394,[671692635/23185]=24165-24160,[-21860- -12218]=0,[-718729475/22675]="TitleHolder",[47942-19928]=1644/137,[181015172/25727]=0,[-633073540/22066]=32452+-32207,[-570344218/-20474]=-16429- -16430,[1.2884410037373197*-14984]="Initializing...",[20696-7006]="SetIcon",[0.81816028798787421*-21112]=0.00026205450733752622*3816,[-138005228/-25834]=-294.13999999999999/-1337,[-0.26148506712941821*-10949]=-0.0033898305084745762*-5310,[14123- -12931]=-3.2350943029989323e-05*-30911,[447038366/15773]=-911.75999999999999/30392,[-46440- -23808]=-17438- -17454,[30269+-3649]=-68205/-13641,[-403497612/17217]=12687-12677,[-23475+31808]=0.00019079418077748629*20965,[36182-15781]=0,[102635856/-3474]=0,[-5814- -4565]=0.00036266924564796907*16544,[246703405/9707]="ProgressBar",[-0.077301660213924803*-30478]=6787/6787,[3674-27567]=-5890- -6090,[-2.7252559726962455*-7618]=10512-10513,[-14983+8772]=0,[-333649548/13668]=0,[-403886598/15098]=13846.560000000001/12363})
    end
    local function F()
        local yc,fc;
        bd["pcall"](function()
            yc=bd["tostring"](bd["game"]["PlaceId"])
        end);
        bd["pcall"](function()
            fc=bd["tostring"](bd["game"]["GameId"])
        end)
        return yc,fc
    end
    local J=lb();
    J["SetSubtitle"]("YOXI HUB (TG_@YomkaMadeIt)");
    J["SetStatus"](Ac(314515227/-23883),bd["Color3"]["fromRGB"](Ac(-275859390/17763),0.11098130841121495*1712,-24247+24437));
    J["SetProgress"](-1637.6000000000001/-32752);
    J["StartLoadingEffects"]()
    local cb,Ya=F()
    local A,Xb,Pb
    if cb and Yc[cb]then
        A=Yc[cb]
        Xb=Ac(0.65011041658868884*26717)
        Pb=cb
    elseif not(Ya and db[Ya])then
    else
        A=db[Ya]
        Xb=Ac(-309758406/-16418)
        Pb=Ya
    end
    if not(A)then
        J["SetSubtitle"]("Detected: Unknown");
        J["SetStatus"]("No match found — Loading UNIVERSAL Script...",bd["Color3"]["fromRGB"](Ac(-0.61095015229180594*13461),-4261670/-18529,-28517- -28697));
        J["SetProgress"](Ac(-29257- -25262));
        J["SetIcon"]("❓");
        bd["print"](Ac(25545- -519))
    else
        J["SetSubtitle"]((Ac(12862+-25681)):format(bd["tostring"](A["name"])));
        J["SetStatus"](Ac(2492- -17713):format(Xb,bd["tostring"](Pb)),bd["Color3"]["fromRGB"](Ac(-41406780/-13021),Ac(99111302/-11881),Ac(-127789375/-4375)));
        J["SetProgress"](Ac(286939185/-26121));
        J["SetIcon"]("⤓");
        bd["print"](Ac(-32937- -2358):format(A["name"],bd["tostring"](Xb),bd["tostring"](Pb)))
    end
    local function t(gc)
        return(function(ya)
            local function vd(va)
                return ya[va+1.3953595433201362*-10861]
            end;
            if not gc or not gc["url"]then
                return vd(50740-19615),vd(76292448/-10526)
            end;
            J["SetProgress"](vd(-3.6078088578088576*1716));
            J["SetStatus"]("Downloading Script Source from URL...",bd["Color3"]["fromRGB"](-23369+23579,vd(31730+3625),-18586+18756));
            J["SetIcon"](vd(25602+-12618))
            local Ub,Eb=Xd(gc["url"])
            if not(not Ub)then
            else
                return false,vd(282594130/-31010):format(bd["tostring"](Eb))
            end;
            J["SetProgress"](vd(998866314/32679));
            J["SetStatus"](vd(-21327- -15365),bd["Color3"]["fromRGB"](5149200/24520,-21871+22101,vd(30448+-10981)));
            J["SetIcon"]("⚙️")
            local Ca,dc
            if bd["type"](bd["loadstring"])==vd(39623-28920)then
                Ca,dc=bd["loadstring"](Ub)
            else
                Ca,dc=bd["load"](Ub)
            end
            if not Ca then
                return false,vd(22892+-25078):format(bd["tostring"](dc))
            end;
            J["SetProgress"](vd(33381+-29785));
            J["SetStatus"]("Executing Compiled Script...",bd["Color3"]["fromRGB"](3856650/18365,-4079970/-17739,vd(56178036/13284)));
            J["SetIcon"]("🚀")
            local Qb,Fa=bd["pcall"](Ca)
            if not(not Qb)then
            else
                return false,("runtime error: %s"):format(bd["tostring"](Fa))
            end;
            J["SetProgress"](-9761+9762);
            J["SetStatus"](vd(39083-8304):format(gc["name"]),bd["Color3"]["fromRGB"](vd(12588+29279),vd(299527080/16932),vd(1.3039008818914679*18483)));
            J["SetIcon"]("✅")
            return true,"ok"
        end)({[51963+-31763]=-3728- -3938,[53646+-26934]=4269300/28462,[3327+-27595]=("http error: %s"),[15872-13337]=1424620/6194,[-0.82844252648097294*25490]="Compiling Downloaded Script...",[7504-9675]="⤓",[-269513822/15542]=("compile error: %s"),[-0.18283582089552239*-23584]=-0.019166750731362855*-9913,[-267960738/23182]=1566.4000000000001/1958,[32.765567765567766*273]=-5298900/-31170,[-0.54975369458128076*-28420]=("Loaded: %s Successfully"),[36415-21004]=-2.2327409127444852e-05*-22394,[-0.22869471413160733*19467]="function",[5672+10298]=false,[130680212/-6122]=21531.25+-21531,[-6651+-15752]="invalid entry",[-1.3258099745176557*8241]=6829-6639})
    end
    local ad,wd
    if A then
        ad,wd=t(A)
        if ad then
            J["SuccessEffects"]();
            bd["task"]["spawn"](function()
                bd["task"]["wait"](2.3866348448687349e-05*25140);
                J["Hide"](true)
            end);
            bd["print"](Ac(55574232/4396):format(A["name"]))
        else
            bd["warn"](Ac(45318-16054):format(A["name"],bd["tostring"](wd)));
            J["SetStatus"](Ac(40701+-15312):format(A["name"]),bd["Color3"]["fromRGB"](31508+-31268,-5181090/-30477,Ac(266484889/-16181)));
            J["SetProgress"](999.89999999999998/5555);
            J["SetIcon"](Ac(8287-6724))
            local pd,Ec=t(_c)
            if pd then
                J["SuccessEffects"]();
                bd["task"]["spawn"](function()
                    bd["task"]["wait"](10613.4/17689);
                    J["Hide"](true)
                end);
                bd["print"]("[YOXI ROUTER] UNIVERSAL loaded as fallback.")
                ad=true
            else
                bd["warn"](Ac(-18639- -27304)..bd["tostring"](Ec));
                J["SetStatus"]("Failed to load UNIVERSAL too.",bd["Color3"]["fromRGB"](0.017650025214321734*11898,-1977820/-15214,Ac(0.44087060294368358*-17597)));
                J["SetProgress"](Ac(-11996- -29008));
                J["SetIcon"]("✖️");
                J["ErrorEffects"]();
                bd["task"]["spawn"](function()
                    return(function(ab)
                        local function xa(x)
                            return ab[x- -974442756/-31804]
                        end;
                        bd["task"]["wait"](18193.5-18190);
                        J["Hide"](xa(25.246302906680267*1961))
                    end)({[0.60985778926955403*30940]=false})
                end)
                ad=false
                wd=Ec
            end
        end
    else
        local Ed,jc=t(_c)
        if not(Ed)then
            bd["warn"](Ac(-20978+22523)..bd["tostring"](jc));
            J["SetStatus"]("Failed to load UNIVERSAL.",bd["Color3"]["fromRGB"](7356+-7146,Ac(339013248/-9744),Ac(360246300/-16300)));
            J["SetProgress"](Ac(-29491+-3510));
            J["SetIcon"]("✖️");
            J["ErrorEffects"]();
            bd["task"]["spawn"](function()
                return(function(ma)
                    local function Ld(Ra)
                        return ma[Ra+334752795/18045]
                    end;
                    bd["task"]["wait"](Ld(-158491040/3755));
                    J["Hide"](Ld(-38824-10623))
                end)({[8013+-31670]=-13552.5+13556,[-4457-26439]=false})
            end)
            ad=false
            wd=jc
        else
            J["SuccessEffects"]();
            bd["task"]["spawn"](function()
                return(function(Nd)
                    local function cc(rb)
                        return Nd[rb-(22109-8565)]
                    end;
                    bd["task"]["wait"](cc(-16301- -26607));
                    J["Hide"](cc(41574-11127))
                end)({[-157265512/-9304]=true,[0.21915397631133671*-14775]=-15656.4/-26094})
            end);
            bd["print"](Ac(-4408-2801))
            ad=true
        end
    end
    if not(ad)then
        bd["warn"]("[YOXI ROUTER] Completed with errors: "..bd["tostring"](wd))
    else
        bd["print"]("[YOXI ROUTER] Completed successfully.")
    end
end)({[-0.93380318454711564*-19155]="name",[-68545312/-10249]="126884695634066",[-0.35353259810607535*-25661]="https://raw.githubusercontent.com/Yomkaa/DANDY-S-WORLD-YOXI-HUB/refs/heads/main/TG_%40YomkaMadeIt",[-11527- -1856]="Detecting game...",[-0.67805820157779306*-30549]="url",[35900-31150]="Grow A Garden",[17922+10965]=("Failed to load %s — Trying UNIVERSAL..."),[-0.42513153822346023*16155]="10324346056",[-0.78912628954187647*-20453]=("[YOXI ROUTER] %s loaded successfully."),[-0.41424497032297847*-25946]="RunService",[0.96566073482644288*29558]="https://raw.githubusercontent.com/Yomkaa/MM2-YOXI-HUB/refs/heads/main/mm2",[52472+-30107]="UniverseId",[-31241+21920]="Detected: %s",[-385079618/-18454]="PlaceId",[-15819+-4114]="Dandy's World",[-47606+25730]="url",[-84333175/-28675]="https://raw.githubusercontent.com/Yomkaa/UNIVERSAL-YOXI-HUB/refs/heads/main/universal",[56151648/-11592]=-422970/-1839,[18191- -2319]=-9.5826745244597776e-07*-20871,[42739-20773]="12552538292",[-34419- -15317]="name",[6680- -5483]="[YOXI ROUTER] UNIVERSAL failed as fallback: ",[-111131352/-8046]="name",[-0.39235599658888287*-12899]="⚠️",[-733031538/24846]=266.30000000000001/13315,[231893520/11208]="Lighting",[-2650-6850]="10324347967",[21.245785270629991*-1127]="Evade",[3140- -24654]="18687417158",[-12747- -22961]="Dandy's World",[-3.6764865598696717*7366]=("[YOXI ROUTER] Detected %s (%s = %s)"),[13474-32077]=1921660/14782,[-15203-17015]="https://raw.githubusercontent.com/Yomkaa/PRESSURE-YOXI-HUB/refs/heads/main/PRESSURE",[25105+5956]="https://raw.githubusercontent.com/Yomkaa/Evade-YOXI-HUB/refs/heads/main/evade",[-302003793/23283]=-4796480/-29978,[-55615568/11768]=26692+-26462,[-1280- -6644]="name",[449992764/15222]="[YOXI ROUTER] No matching PlaceId/UniverseId found. Loading UNIVERSAL.",[61725503/-6167]="name",[-63568548/-12889]="name",[464568589/-16369]="Evade",[39726228/1676]=("Source: %s (%s) — Preparing Download..."),[-306355964/19834]="name",[-33360060/7831]=-0.0061236987140232697*-21229,[-768563758/-23459]=("[YOXI ROUTER] Failed to load %s: %s"),[4.1131707317073172*-4100]="https://raw.githubusercontent.com/Yomkaa/BBA-YOXI-HUB/refs/heads/main/main",[1.7698956596900661*16197]="TweenService",[-27093- -18893]="name",[-0.42325825039287585*9545]="url",[-2046- -1549]=-3781.6799999999998/-31514,[8159-14363]="name",[165020967/-22041]=-4092.75/-27285,[-0.32393505586592181*11456]="[YOXI ROUTER] UNIVERSAL loaded.",[0.17056754380031117*29566]="[YOXI ROUTER] Failed to load UNIVERSAL: ",[-399542184/14788]="url",[552059642/19763]="name",[-38688+26656]=17723+-17533,[10278-3600]=4366090/18983,[297793704/-9516]=-11934+12064,[44090-11383]=-15776+15956,[19808-32560]="url",[-895836200/-27692]="name",[215955300/-17050]="https://raw.githubusercontent.com/Yomkaa/Bee-Swarm-Sim-YOXI-HUB/refs/heads/main/bss",[-484634436/17511]="name",[1.3872156960759809*16004]="url",[56910-26939]="Bee Swarm Simulator",[10250- -2387]="url",[-19914192/-1968]="https://raw.githubusercontent.com/Yomkaa/Grace-YOXI-HUB/refs/heads/main/grace"},...)
