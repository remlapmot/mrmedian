{smcl}
{* *! version 0.1.0  10jun2017 Tom Palmer}{...}
{vieweralsosee "mrrobust" "help mrrobust"}{...}
{viewerjumpto "Syntax" "mrivests##syntax"}{...}
{viewerjumpto "Description" "mrivests##description"}{...}
{viewerjumpto "Options" "mrivests##options"}{...}
{viewerjumpto "Example" "mrivests##examples"}{...}
{viewerjumpto "Author" "mrivests##author"}{...}
{title:Title}

{p 5}
{bf:mrivests} {hline 2} Generate genotype specific instrumental variable ratio (Wald) estimates in a dataset
{p_end}

{marker syntax}{...}
{title:Syntax}

{p 8 16 2}
{opt mrivests} {var:_gd} {var:_gdse} {var:_gp} [{var:_gpse} {var:_cov}]
{ifin} [{cmd:,} {it:options}]

{synoptset 27 tabbed}{...}
{synopthdr}
{synoptline}
{synopt :{opt g:enerate(varlist, replace)}}Variables to contain IV ests and SEs or CI limits{p_end}
{synopt :{opt *:}}options passed to {cmd:mrratio}{p_end}

{marker description}{...}
{title:Description}

{pstd}
{cmd:mrivests} calls {cmd:mrratio} to put the instrumental variable ratio 
(Wald) estimate and its standard error in the variables specified.

{pstd}
{var:_gd} is a variable containing genotype-disease association estimates.

{pstd}
{var:_gdse} is a variable containing the standard errors of the 
genotype-disease association estimates.

{pstd}
{var:_gp} is a variable containing genotype-phenotype association estimates.

{pstd}
{var:_gpse} is a variable containing the standard errors of the 
genotype-phenotype association estimates.

{pstd}
{var:_cov} is a variable containing the covariance between the 
genotype-disease and the genotype-phenotype estimates.

{marker options}{...}
{title:Options}

{phang}
{opt g:enerate(varlist, replace)} specifies the variables (2 or 3) 
to contain the IV 
estimates and their standard errors or confidence interval limits. Specifying 
{cmd:replace} replaces the values in these variables if they already exist 
in the dataset.

{phang}
{opt *} options passed through to {help mrratio}, e.g. {cmd:nome}.

{marker examples}{...}
{title:Example}

{pstd}Using the data provided by Do et al., Nat Gen, 2013 generate genotype 
specific estimates for the LDL-c phenotype.{p_end}

{pstd}Setup{p_end}
{phang2}{cmd:.} {stata "use https://raw.github.com/remlapmot/mrrobust/master/dodata, clear"}{p_end}

{pstd}Select observations ({it:p}-value with exposure < 10^-8){p_end}
{phang2}{cmd:.} {stata "gen byte sel1 = (ldlcp2 < 1e-8)"}{p_end}

{pstd}Generate IV estimates in dataset{p_end}
{phang2}{cmd:.} {stata "mrivests chdbeta chdse ldlcbeta ldlcse if sel1==1, generate(ivest ivse)"}{p_end}

{pstd}Generate IV estimates with SEs assuming NOME{p_end}
{phang2}{cmd:.} {stata "mrivests chdbeta chdse ldlcbeta if sel1==1, generate(ivest ivse, replace) nome"}{p_end}

{pstd}Generate IV estimates with CI limits using Fieller's Theorem{p_end}
{phang2}{cmd:.} {stata "drop ivest"}{p_end}
{phang2}{cmd:.} {stata "mrivests chdbeta chdse ldlcbeta ldlcse if sel1==1, generate(ivest ivcilow ivciupp) fieller"}{p_end}

{marker author}
{title:Author}

{phang}Tom Palmer, Department of Mathematics and Statistics, Lancaster University, UK. 
 {browse "mailto:tom.palmer@lancaster.ac.uk":tom.palmer@lancaster.ac.uk}.{p_end}

{phang}If you find any bugs or have questions please send me an email or create an issue on the GitHub repo: {browse "https://github.com/remlapmot/mrrobust/issues"} {p_end}
