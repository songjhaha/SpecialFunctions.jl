@testset "incomplete gamma ratios" begin
#Computed using Wolframalpha gamma(a,x)/gamma(a) ~ gamma_q(a,x,0) function.
    @test gamma_inc(10, 10)[2] ≈ 0.45792971447185221
    @test gamma_inc(1, 1)[2] ≈ 0.3678794411714423216
    @test gamma_inc(0.5, 0.5)[2] ≈ 0.31731050786291410
    @test gamma_inc(BigFloat(30.5), BigFloat(30.5))[2] ≈ parse(BigFloat,"0.47591691193354987004") rtol=eps()
    @test gamma_inc(5.5, 0.5)[2] ≈ 0.9999496100513121669
    @test gamma_inc(0.5, 7.4)[2] ≈ 0.0001195355018130302
    @test gamma_inc(0.5, 0.22)[2] ≈ 0.507122455359825146
    @test gamma_inc(0.5, 0.8)[2] ≈ 0.20590321073206830887
    @test gamma_inc(11.5, 0.5)[2] ≈ 0.999999999998406112
    @test gamma_inc(0.19, 0.99)[2] ≈ 0.050147247342905857
    @test gamma_inc(0.9999, 0.9999)[2] ≈ 0.3678730556923103
    @test gamma_inc(24, 23.9999999999)[2] ≈ 0.472849720555859138
    @test gamma_inc(0.5, 0.55)[2] ≈ 0.29426610430496289
    @test gamma_inc(Float32(0.5), Float32(0.55))[2] ≈ Float32(gamma_inc(0.5,0.55)[2])
    @test gamma_inc(Float16(0.5), Float16(0.55))[2] ≈ Float16(gamma_inc(0.5,0.55)[2])
    @test gamma_inc(30, 29.99999)[2] ≈ 0.475717712451705704
    @test gamma_inc(30, 29.9)[2] ≈ 0.482992166284958565
    @test gamma_inc(10, 0.0001)[2] ≈ 1.0000
    @test gamma_inc(0.0001, 0.0001)[2] ≈ 0.000862958131006599
    @test gamma_inc(0.0001, 10.5)[1] ≈ 0.999999999758896146
    @test gamma_inc(1, 1)[1] ≈ 0.63212055882855768
    @test gamma_inc(13, 15.1)[2] ≈ 0.25940814264863701
    @test gamma_inc(0.6, 1.3)[2] ≈ 0.136458554006505355
    @test gamma_inc(100, 80)[2] ≈ 0.9828916869648668
    @test gamma_inc(100, 80, 1)[2] ≈ 0.9828916869
    @test Float16(gamma_inc(100, 80, 2)[2]) ≈ Float16(.983)
    @test gamma_inc(13.5, 15.1)[2] ≈ 0.305242642543419087
    @test gamma_inc(11, 9)[1] ≈ 0.2940116796594881834
    @test gamma_inc(8, 32)[1] ≈ 0.99999989060651042057
    @test gamma_inc(15, 16)[2] ≈ 0.3675273597655649298
    @test gamma_inc(15.5, 16)[2] ≈ 0.4167440299455427811
    @test gamma_inc(0.9, 0.8)[1] ≈ 0.59832030278768172
    @test gamma_inc(1.7, 2.5)[1] ≈ 0.78446115627678957
    @test gamma_inc(11.1, 0.001)[2] ≈ 1.0000
    @test gamma_inc(1e7, 1e7 + 1)[1] ≈ 0.5001682088254367
    @test gamma_inc(1e7, 1e7 + 1)[2] ≈ 0.4998317911745633
    @test gamma_inc(29.0, 0.3)[1] ≈ 5.80834761514062e-47
    @test gamma_inc(29.0, 1000.0)[2] == 0.0
    @test gamma_inc(1e300, 1e-100)[1] == 0.0
    @test gamma_inc(7.098843361278083e33, 7.098843361278083e33*2)[2] == 0.0
    @test gamma_inc(7.098843361278083e33, 7.098843361278083e33/2)[1] == 0.0
    @test gamma_inc(1.1, 1e3)[2] == 0.0
    @test gamma_inc(24.0, 1e-323)[1] == 0.0
    @test gamma_inc(6311.0, 6311.0*0.59999)[1] < 1e-300
    @test_throws DomainError gamma_inc(-1, 2, 2)
    @test_throws DomainError gamma_inc(0, 0, 1)
    @test_throws DomainError gamma_inc(7.098843361278083e33, 7.09884336127808e33)
    @test_throws DomainError gamma_inc(6.693195169205051e28, 6.693195169205049e28)
end

@testset "inverse of incomplete gamma ratios" begin
#Compared with Scipy.special.gammaincinv
    @test gamma_inc_inv(1.0,0.5,0.5) ≈ 0.69314718055994529
    ctr=1
    ans1 = [7.4153939596077105e-06, 4.1948837553001128e-05, 0.00011560348487144592, 0.00023733157806706144, 0.00041465371557152853, 0.00065420366900931063, 0.00096200074513191707, 0.0013436111982025845, 0.0018042543050560357, 0.0023488772409990069, 0.0029822108340951982, 0.0037088128669865747, 0.0045331028890989175, 0.0054593910326394268, 0.0064919024756292113, 0.0076347986776777021, 0.0088921961857776899, 0.010268183591667559, 0.011766837076460529, 0.013392234877244308, 0.015148470939019535, 0.01703966796416153, 0.019069990034434534, 0.021243654953428382, 0.02356494643740838, 0.026038226268114743, 0.028667946510727123, 0.031458661893117974, 0.034415042438025324, 0.037541886437423046, 0.040844133857854445, 0.044326880266606375, 0.047995391371211706, 0.051855118268798489, 0.055911713507252728, 0.060171048067033703, 0.064639229380863375, 0.069322620518498704, 0.074227860675536064, 0.079361887118881563, 0.084731958757381876, 0.090345681524433508, 0.09621103578051432, 0.10233640596793599, 0.10873061277817557, 0.11540294812451861, 0.12236321325012786, 0.12962176034488948, 0.13718953809449788, 0.14507814164343533, 0.15329986752124386, 0.16186777416055501, 0.17079574872787454, 0.18009858109673355, 0.18979204592069479, 0.19989299391476917, 0.21041945363284603, 0.22139074524173796, 0.23282760804678732, 0.24475234382888267, 0.25718897841979127, 0.27016344438650586, 0.28370378823436093, 0.29784040619656998, 0.3126063134848735, 0.32803745287127684, 0.34417304970517859, 0.36105602201014886, 0.37873345623790661, 0.39725716170037845, 0.41668431981048032, 0.43707824825000413, 0.45850930533751827, 0.4810559665889298, 0.50480611430358513, 0.52985859275268155, 0.55632509731250579, 0.58433248729003373, 0.61402564160686812, 0.64557101747749401, 0.67916113010215806, 0.71502025447176809, 0.75341177168885431, 0.79464776273185678, 0.83910172694543061, 0.8872257293787823, 0.93957396283390326, 0.99683583211997739, 1.0598835767754553, 1.1298428254726491, 1.2082007260001051, 1.296978498210863, 1.3990206562238474, 1.5185103158285946, 1.6619620177540984, 1.8403447442261882, 2.0743414883146705, 2.4107139457641296, 3.0000967446589719]
    ans2 = [0.0028980766274747166, 0.006908184939374363, 0.01149696382036067, 0.016518276652159908, 0.02189753286142773, 0.027589145508248085, 0.03356249352199024, 0.03979579246097344, 0.046272957709150415, 0.052981821800176826, 0.05991304249771414, 0.06705939521991744, 0.07441529398164964, 0.08197645553388541, 0.08973965716025696, 0.09770255795612678, 0.10586356446493835, 0.11422172813580914, 0.12277666614622669, 0.1315284997431042, 0.14047780597228823, 0.14962557982476085, 0.15897320462672093, 0.16852242906309764, 0.17827534962728914, 0.18823439758407795, 0.19840232975077693, 0.2087822225659563, 0.21937746904082012, 0.23019177828605702, 0.24122917738430874, 0.2524940154406757, 0.2639909696948641, 0.27572505362160177, 0.2877016269830214, 0.29992640782953106, 0.31240548647561406, 0.325145341505105, 0.33815285788768823, 0.35143534731545956, 0.36500057089608295, 0.3788567643680646, 0.3930126660346167, 0.40747754764618266, 0.4222612484987209, 0.4373742130560526, 0.4528275324509786, 0.4686329902724166, 0.48480311310582785, 0.5013512263630729, 0.5182915160173085, 0.5356390969506658, 0.5534100887296879, 0.5716216997488716, 0.5902923208297984, 0.6094416295366399, 0.6290907066738872, 0.649262166675578, 0.6699803038855925, 0.6912712570761026, 0.7131631949691678, 0.7356865260311793, 0.7588741364223205, 0.7827616607300203, 0.807387791030685, 0.832794630951811, 0.8590281028041281, 0.8861384175955134, 0.9141806199237333, 0.943215222504511, 0.9733089486005939, 1.0045356051136263, 1.0369771149071734, 1.0707247444923012, 1.1058805731481947, 1.1425592627436494, 1.1808902052215764, 1.2210201487102676, 1.2631164361809093, 1.307371036420099, 1.354005611796903, 1.4032779600790313, 1.4554903028704096, 1.5110000943860755, 1.5702343296128558, 1.633708805354231, 1.7020545444724036, 1.7760548371325608, 1.8566984660391717, 1.9452584157780999, 2.043412265612975, 2.153433912595464, 2.278514210551947, 2.4233308771016073, 2.595143613479916, 2.8061289679463384, 3.079145167578199, 3.4655956756034487, 4.12987911692835]
    ans3 = [0.1071755222650277, 0.16050998728955507, 0.20416656508566741, 0.24280678250939972, 0.27826797183157947, 0.31150317301391278, 0.34308358281638091, 0.37338428082062985, 0.40266774948514333, 0.43112656018759449, 0.45890727249428631, 0.48612476640606467, 0.51287131234095706, 0.53922256543527058, 0.5652416715299875, 0.5909821656505071, 0.61649007140344114, 0.64180545586647186, 0.66696360394811371, 0.69199592089152651, 0.71693063676844848, 0.7417933642658795, 0.76660754611766135, 0.7913948184012789, 0.81617530891938483, 0.84096788496285169, 0.86579036123554576, 0.89065967617260244, 0.91559204301304553, 0.94060308059774034, 0.96570792782021209, 0.99092134486698613, 1.0162578037796903, 1.04173157040596, 1.0673567794461716, 1.0931475040232679, 1.1191178209852426, 1.1452818729806347, 1.1716539282165654, 1.198248438708915, 1.2250800977595322, 1.2521638973416984, 1.2795151860393545, 1.3071497281656619, 1.3350837646807319, 1.363334076536002, 1.3919180510932918, 1.4208537523000897, 1.4501599953496895, 1.4798564266162111, 1.5099636097318834, 1.5405031187690257, 1.571497639604559, 1.6029710806837836, 1.6349486945666225, 1.6674572118386319, 1.7005249892070939, 1.7341821738873691, 1.7684608867260749, 1.8033954269180192, 1.839022501668433, 1.8753814847505423, 1.9125147086353582, 1.9504677957575041, 1.9892900355679812, 2.0290348153641435, 2.0697601145466438, 2.1115290740202663, 2.1544106550478053, 2.1984804051368831, 2.2438213526962998, 2.2905250575198943, 2.3386928510229508, 2.3884373090925655, 2.4398840121490508, 2.4931736625766741, 2.5484646505330266, 2.6059361873998439, 2.6657921648912399, 2.7282659516930696, 2.7936264154376702, 2.8621855665549849, 2.9343083789530127, 3.0104255776654698, 3.0910505401567816, 3.176802011280996, 3.2684352132712395, 3.3668853781968782, 3.4733301840058628, 3.5892819029224894, 3.7167280552758761, 3.8583548958347427, 4.0179202697917491, 4.2009145830871581, 4.4158272046973419, 4.6768376437172963, 5.0104347814570787, 5.4758322541221567, 6.2608605070659076]
    ans4 = [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 9.793e-320, 8.8258281996309067e-311, 5.2442064082758777e-302, 2.0885820384164982e-293, 5.6626416070015106e-285, 1.0605839281955743e-276, 1.3913463845423177e-268, 1.2952838036620446e-260, 8.6636808810333524e-253, 4.2124146389233922e-245, 1.5054592477106387e-237, 3.9965668615698637e-230, 7.9602338168240791e-223, 1.20090997348131e-215, 1.3847294830684997e-208, 1.2309060164407832e-201, 8.5045125183290383e-195, 4.6029057651609662e-188, 1.9661243539196415e-181, 6.675413023480524e-175, 1.8137947775332813e-168, 3.9697776116742062e-162, 7.0423151317779386e-156, 1.0186480541842382e-149, 1.2082919222730254e-143, 1.1817770759861981e-137, 9.5806543461731422e-132, 6.4705147650865631e-126, 3.6582023269162791e-120, 1.7394045962948254e-114, 6.9867971004491818e-109, 2.3810402190694626e-103, 6.9129343541856114e-98, 1.71669965360591e-92, 3.6603939138610754e-87, 6.7261696481112057e-82, 1.0689601189656641e-76, 1.4743519045954981e-71, 1.7706253773856427e-66, 1.85749673681364e-61, 1.7074484121414459e-56, 1.3793741591778402e-51, 9.8216596440656967e-47, 6.1811283531832712e-42, 3.447488184610534e-37, 1.7085354519424486e-32, 7.5427383121540407e-28, 2.9735875496464905e-23, 1.0493212802006967e-18, 3.3220770969837717e-14, 9.4569508903874499e-10, 2.4259428385570885e-05]
    ans5 = [68.182564057578659, 70.357062784263817, 71.760877899786948, 72.829353353366415, 73.706386972437542, 74.458490388905602, 75.12219461238017, 75.719845624365121, 76.266166586236068, 76.771402301686194, 77.242986392330991, 77.686494958669414, 78.106225421683931, 78.50556502309793, 78.887234808310836, 79.253456568431432, 79.606070310177984, 79.946618932262979, 80.276410559274709, 80.596565284301676, 80.908050799453733, 81.211709956856978, 81.508282370701906, 81.798421552199031, 82.082708649987609, 82.361663579041377, 82.635754117812908, 82.905403408390271, 83.170996189584713, 83.432884016058068, 83.691389659635405, 83.946810846256611, 84.199423449687018, 84.449484238382098, 84.697233252859277, 84.942895876083071, 85.18668464780427, 85.428800864609457, 85.669436000206872, 85.908772974675117, 86.146987296778406, 86.384248099705346, 86.620719087619619, 86.856559407959935, 87.091924462499136, 87.326966668607852, 87.561836180921006, 87.796681582652582, 88.031650555063862, 88.266890533043721, 88.502549354439552, 88.738775910585431, 88.975720805449285, 89.213537031000897, 89.45238066667676, 89.692411611339708, 89.933794356792788, 90.176698812815317, 90.421301194840566, 90.667784986823875, 90.916341993645545, 91.167173499597013, 91.420491552216376, 91.676520394081336, 91.935498069297722, 92.197678236508722, 92.463332226600599, 92.732751391148227, 93.006249797557189, 93.284167339317776, 93.566873345624515, 93.854770794832618, 94.148301262289351, 94.447950766886493, 94.754256724998356, 95.067816279076155, 95.38929634645433, 95.719445839736153, 96.059110654771956, 96.409252222677836, 96.770970703934069, 97.145534304515252, 97.534416777401361, 97.939346035676579, 98.362368106482464, 98.805932668773451, 99.273009611654814, 99.767251266034179, 100.2932237698064, 100.85674648050276, 101.46540670265372, 102.12937183070848, 102.86273396770143, 103.68587349786873, 104.62994489700357, 105.74630631344544, 107.12941611870914, 108.98632200164798, 111.9556294726119]
    for x = 0.01:0.01:0.99
        @test gamma_inc_inv(0.4, x, 1.0-x) ≈ ans1[ctr]#scipy.special.gammaincinv(0.4,x)
        @test gamma_inc_inv(0.8, x, 1.0-x) ≈ ans2[ctr]#scipy.special.gammaincinv(0.8,x)
        @test gamma_inc_inv(1.8, x, 1.0-x) ≈ ans3[ctr]#scipy.special.gammaincinv(1.8,x)
        @test gamma_inc_inv(0.001, x, 1.0-x) ≈ ans4[ctr]#scipy.special.gammaincinv(.001,x)
        @test gamma_inc_inv(88.6, x, 1.0-x) ≈ ans5[ctr]#scipy.special.gammaincinv(88.6,x)
        ctr+=1
    end
    for x=-.5:.5:.9
        @test SpecialFunctions.loggamma1p(x) ≈ loggamma(1.0+x)
    end
    for x = .5:5.0:100.0
        @test SpecialFunctions.stirling_error(x) ≈ log(gamma(x)) - (x-.5)*log(x)+x- log(2*pi)/2.0
    end
end

double(x::Real) = Float64(x)
double(x::Integer) = Int(x)
double(x::Complex) = ComplexF64(x)

@testset "upper incomplete gamma function" begin
    setprecision(BigFloat, 256) do
        for a in Any[0:0.4:3; 1:3], x in 0:0.2:2
            @test gamma(a,x) ≈ gamma(big(a),big(x))
        end
        @test_throws DomainError gamma(-2.2, -1.3)
        for (a,x, exact) in (
            (2, big"+1.3", big"0.6268231239782289871813662853957039889809398944861850589869804057956189274569818"),
            (2, big"-1.3", big"-1.100789000285773266137246974803445875429455665367265440176867948378982424804222"),
            (big"2.2", big"1.3", big"0.7550934853735524106456916078787596171599416239996064979513848803118671763945577"),
            (big"-2.2", big"1.3", big"0.03938564959393195337328006806473296774233286427565465045140458665248322893076784"),
            (big"-2.2", big"-1.3"+0im, Complex(big"0.1688350167695890519002747177035271528716667324397453142169971691104641885370081", big"-1.724677939954414412829215929952389349929001266936564849801773346878175589599461")),
            (2, big"1.3"+2im, Complex(big"0.2347744561498965806069446787000456827042253434143074251879541754828136789074293", big"-0.7967951407674886396960561446265346226800340382780520672369163777061700801594228")),
            (big"2.2", big"1.3"+2im, Complex(big"0.4226969694490623767886715572749155659150206342283251276656790859161308520476838", big"-0.9507541450333763666696561254491461255244463810462729822382144498284499948680099")),
            (big"2.2"-2im, big"1.3"+2im, Complex(big"-3.858698824275578861673404086439928163791926530897603434146764316225759116935376", big"0.2105970967650200831829566202893410569725743566037534990454186505024476246014339")),
            (30, big"-1e2", big"-2.080142496354742431762923569133534773079637504483999408076147454085194055640495e+101"),
            )
            if !(exact isa Complex) # we don't yet have a Complex{BigFloat} gamma function
                @test gamma(a, x) ≈ exact atol=eps(abs(exact))*1000
            end
            @test gamma(double(a), double(x)) ≈ double(exact) rtol=1e-13
        end
    end
    @test gamma(30, big(-1000)) ≈ big"-1.914496653187781420578078670260160511219745144309147121829045802464973219500799e+521" rtol=1e-70
    @test gamma(30, -1000) == -Inf
    @test gamma(Inf, 51.2) == Inf
    @test gamma(-Inf, -51.2) == 0.0
    @test_throws DomainError gamma(Inf, -51.2)
    @test gamma(2.3, Inf) == 0.0
    @test gamma(2, -Inf) == -Inf
    @test_throws DomainError gamma(2.2, -Inf)
end

@testset "upper incomplete gamma function logarithm" begin
    for (a,z) in ((3,5), (3,-5), (3,5+4im), (3,-5+4im), (3,5-4im), (-3,5+4im), (-3,-5+4im))
        @test exp(loggamma(a,z)) ≈ gamma(a,z) rtol=1e-13
    end
    @test loggamma(50, 1e7) ≅ -9.9992102133082030308153473164868727954977460876571275797855e6
    @test real(loggamma(50, 1e7 + 1e8im)) ≅ -9.999097142860392e6
    @test cis(imag(loggamma(50, 1e7 + 1e8im))) ≈ cis(1.0275220422549918) rtol=1e-8
    @test real(loggamma(10+20im, -1e5 + 1e8im)) ≈ 100134.3502048662475864409896160245625409130538724704329203542339
    @test cis(imag(loggamma(10+20im, -1e5 + 1e8im))) ≈ cis(-2.6572071454623347) rtol=1e-8
    @test loggamma(-1e8, 1e9) ≅ -3.0723266045132171331933746054573197040165846554476396719312e9
    @test loggamma(3, Inf) == -Inf
    @test_throws DomainError loggamma(3, -Inf)
    @test loggamma(Inf, 3.2) == Inf
    @test loggamma(-Inf, 3.2) == -Inf
    @test_throws DomainError loggamma(Inf, -3.2)
    @test loggamma(117.3, 0) == loggamma(117.3)
    @test loggamma(7, -300.2) ≅ log(gamma(7, -300.2))
    @test_throws DomainError loggamma(6, -3.2)
end
