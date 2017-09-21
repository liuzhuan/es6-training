<map version="freeplane 1.6.0">
<!--To view this file, download free mind mapping software Freeplane from http://freeplane.sourceforge.net -->
<node TEXT="Promise" FOLDED="false" ID="ID_59468772" CREATED="1505950792402" MODIFIED="1505950797951" STYLE="oval">
<font SIZE="18"/>
<hook NAME="MapStyle">
    <properties fit_to_viewport="false" edgeColorConfiguration="#808080ff,#ff0000ff,#0000ffff,#00ff00ff,#ff00ffff,#00ffffff,#7c0000ff,#00007cff,#007c00ff,#7c007cff,#007c7cff,#7c7c00ff"/>

<map_styles>
<stylenode LOCALIZED_TEXT="styles.root_node" STYLE="oval" UNIFORM_SHAPE="true" VGAP_QUANTITY="24.0 pt">
<font SIZE="24"/>
<stylenode LOCALIZED_TEXT="styles.predefined" POSITION="right" STYLE="bubble">
<stylenode LOCALIZED_TEXT="default" ICON_SIZE="12.0 pt" COLOR="#000000" STYLE="fork">
<font NAME="SansSerif" SIZE="10" BOLD="false" ITALIC="false"/>
</stylenode>
<stylenode LOCALIZED_TEXT="defaultstyle.details"/>
<stylenode LOCALIZED_TEXT="defaultstyle.attributes">
<font SIZE="9"/>
</stylenode>
<stylenode LOCALIZED_TEXT="defaultstyle.note" COLOR="#000000" BACKGROUND_COLOR="#ffffff" TEXT_ALIGN="LEFT"/>
<stylenode LOCALIZED_TEXT="defaultstyle.floating">
<edge STYLE="hide_edge"/>
<cloud COLOR="#f0f0f0" SHAPE="ROUND_RECT"/>
</stylenode>
</stylenode>
<stylenode LOCALIZED_TEXT="styles.user-defined" POSITION="right" STYLE="bubble">
<stylenode LOCALIZED_TEXT="styles.topic" COLOR="#18898b" STYLE="fork">
<font NAME="Liberation Sans" SIZE="10" BOLD="true"/>
</stylenode>
<stylenode LOCALIZED_TEXT="styles.subtopic" COLOR="#cc3300" STYLE="fork">
<font NAME="Liberation Sans" SIZE="10" BOLD="true"/>
</stylenode>
<stylenode LOCALIZED_TEXT="styles.subsubtopic" COLOR="#669900">
<font NAME="Liberation Sans" SIZE="10" BOLD="true"/>
</stylenode>
<stylenode LOCALIZED_TEXT="styles.important">
<icon BUILTIN="yes"/>
</stylenode>
</stylenode>
<stylenode LOCALIZED_TEXT="styles.AutomaticLayout" POSITION="right" STYLE="bubble">
<stylenode LOCALIZED_TEXT="AutomaticLayout.level.root" COLOR="#000000" STYLE="oval" SHAPE_HORIZONTAL_MARGIN="10.0 pt" SHAPE_VERTICAL_MARGIN="10.0 pt">
<font SIZE="18"/>
</stylenode>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,1" COLOR="#0033ff">
<font SIZE="16"/>
</stylenode>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,2" COLOR="#00b439">
<font SIZE="14"/>
</stylenode>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,3" COLOR="#990000">
<font SIZE="12"/>
</stylenode>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,4" COLOR="#111111">
<font SIZE="10"/>
</stylenode>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,5"/>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,6"/>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,7"/>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,8"/>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,9"/>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,10"/>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,11"/>
</stylenode>
</stylenode>
</map_styles>
</hook>
<hook NAME="AutomaticEdgeColor" COUNTER="2" RULE="ON_BRANCH_CREATION"/>
<node TEXT="background" POSITION="right" ID="ID_1358221870" CREATED="1505950850614" MODIFIED="1505950853591">
<edge COLOR="#ff0000"/>
<node TEXT="call stack" ID="ID_1231314841" CREATED="1505950871166" MODIFIED="1505950878129"/>
<node TEXT="event loop" ID="ID_1352978598" CREATED="1505950896664" MODIFIED="1505950899132">
<node TEXT="task queue" ID="ID_1720049728" CREATED="1505950920437" MODIFIED="1505950924202"/>
<node TEXT="Timers" ID="ID_147377412" CREATED="1505988494042" MODIFIED="1505988495786"/>
<node TEXT="DOM changes" ID="ID_448388961" CREATED="1505988510634" MODIFIED="1505988530828">
<node TEXT="requestAnimationFrame()" ID="ID_1663207166" CREATED="1505988531197" MODIFIED="1505988540668"/>
</node>
<node TEXT="Run-to-completion semantics" ID="ID_74446301" CREATED="1505988543515" MODIFIED="1505988551549"/>
</node>
<node TEXT="receiving results asynchronously" ID="ID_1439727095" CREATED="1505988612094" MODIFIED="1505988632641">
<node TEXT="events" ID="ID_739605154" CREATED="1505988632935" MODIFIED="1505988634488">
<node TEXT="XMLHttpRequest" ID="ID_544309969" CREATED="1505988652632" MODIFIED="1505988657337">
<node TEXT="onload" ID="ID_565441631" CREATED="1505988661464" MODIFIED="1505988663433"/>
<node TEXT="onerror" ID="ID_1729131980" CREATED="1505988664073" MODIFIED="1505988665817"/>
</node>
<node TEXT="don&apos;t work well for single results" ID="ID_1117089078" CREATED="1505988719755" MODIFIED="1505988727068"/>
</node>
<node TEXT="callbacks" ID="ID_581414682" CREATED="1505988634704" MODIFIED="1505988636793">
<node TEXT="fs.readFile()" ID="ID_1064092081" CREATED="1505988781102" MODIFIED="1505988785598"/>
<node TEXT="CPS" ID="ID_1718434444" CREATED="1505988812415" MODIFIED="1505988814184">
<node TEXT="continuation-passing style" ID="ID_918274735" CREATED="1505988814487" MODIFIED="1505988823233"/>
</node>
<node TEXT="callback hell" ID="ID_944032335" CREATED="1505988862745" MODIFIED="1505988865762"/>
<node TEXT="pros" ID="ID_851431549" CREATED="1505988947100" MODIFIED="1505988948629">
<node TEXT="easy to understand" ID="ID_1248102259" CREATED="1505988950556" MODIFIED="1505988954797"/>
</node>
<node TEXT="cons" ID="ID_524600614" CREATED="1505988948837" MODIFIED="1505988949773">
<node TEXT="complicated error handling" ID="ID_752613588" CREATED="1505988958925" MODIFIED="1505988964670">
<node TEXT="via callback" ID="ID_1364304332" CREATED="1505988972518" MODIFIED="1505988983087"/>
<node TEXT="via exception" ID="ID_1059273275" CREATED="1505988983358" MODIFIED="1505988989447"/>
</node>
<node TEXT="less elegant signatures" ID="ID_410048983" CREATED="1505988996647" MODIFIED="1505989002248">
<node TEXT="input and output are mixed" ID="ID_1650416564" CREATED="1505989022128" MODIFIED="1505989031065"/>
<node TEXT="return value doesn&apos;t matter" ID="ID_1680563928" CREATED="1505989034265" MODIFIED="1505989045449"/>
</node>
<node TEXT="composition is more complicated" ID="ID_1083465447" CREATED="1505989048977" MODIFIED="1505989054658"/>
</node>
</node>
</node>
</node>
<node TEXT="overview" POSITION="left" ID="ID_1440590999" CREATED="1505989716813" MODIFIED="1505989718990">
<edge COLOR="#0000ff"/>
<node TEXT="More effort for implementor of asynchronous" ID="ID_166569250" CREATED="1505989764375" MODIFIED="1505989782656"/>
<node TEXT="simplify for function users" ID="ID_19175603" CREATED="1505989782959" MODIFIED="1505989799721"/>
<node TEXT="keywords" ID="ID_727905695" CREATED="1505989817961" MODIFIED="1505989819762">
<node TEXT="Promise" ID="ID_186443496" CREATED="1505989820161" MODIFIED="1505989822138"/>
<node TEXT="then" ID="ID_690756248" CREATED="1505989822801" MODIFIED="1505989827084"/>
<node TEXT="catch" ID="ID_1713895194" CREATED="1505989827265" MODIFIED="1505989828515"/>
</node>
<node TEXT="chaining then calls" ID="ID_1873940069" CREATED="1505989848706" MODIFIED="1505989854035">
<node TEXT="then() always returns a Promise" ID="ID_356667228" CREATED="1505989856682" MODIFIED="1505989863148"/>
</node>
<node TEXT="executing asynchronous functions in parallel" ID="ID_1428434908" CREATED="1505990014017" MODIFIED="1505990025210">
<node TEXT="Promise.all()" ID="ID_975892843" CREATED="1505990030874" MODIFIED="1505990036515">
<node TEXT="input" ID="ID_650765861" CREATED="1505990052115" MODIFIED="1505990053644">
<node TEXT="Array of Promises" ID="ID_1642196064" CREATED="1505990056547" MODIFIED="1505990063116"/>
</node>
<node TEXT="output" ID="ID_743918596" CREATED="1505990053891" MODIFIED="1505990055372">
<node TEXT="a single Promise fulfilled with an Array of the results" ID="ID_1509038025" CREATED="1505990070060" MODIFIED="1505990086493"/>
</node>
</node>
</node>
<node TEXT="stand-in for the async operation" ID="ID_245520155" CREATED="1505990130910" MODIFIED="1505990139863">
<node TEXT="&#x5f69;&#x7968;" ID="ID_1812836720" CREATED="1505990165648" MODIFIED="1505990170204"/>
<node TEXT="states" ID="ID_420281825" CREATED="1505990361208" MODIFIED="1505990368064">
<node TEXT="pending" ID="ID_1918768113" CREATED="1505990371968" MODIFIED="1505990373635"/>
<node TEXT="fulfilled" ID="ID_1982088061" CREATED="1505990374008" MODIFIED="1505990379457"/>
<node TEXT="rejected" ID="ID_939833140" CREATED="1505990379744" MODIFIED="1505990382562"/>
</node>
</node>
<node TEXT="Compares with callbacks" ID="ID_139067845" CREATED="1505990833915" MODIFIED="1505990842108">
<node TEXT="No inversion of control" ID="ID_1154429572" CREATED="1505990842587" MODIFIED="1505990848428"/>
<node TEXT="Chaining is simpler" ID="ID_1387918652" CREATED="1505990849700" MODIFIED="1505990854205"/>
<node TEXT="Composing asynchronus calls" ID="ID_299815303" CREATED="1505990915343" MODIFIED="1505990927904"/>
<node TEXT="Error Handling" ID="ID_1765438887" CREATED="1505990931583" MODIFIED="1505990935032"/>
<node TEXT="Cleaner Signatures" ID="ID_1912864330" CREATED="1505990946344" MODIFIED="1505990952225"/>
<node TEXT="Standardized" ID="ID_428063263" CREATED="1505990974873" MODIFIED="1505990979242">
<node TEXT="Node.js callbacks" ID="ID_1289716820" CREATED="1505990989066" MODIFIED="1505990993578"/>
<node TEXT="XMLHttpRequest" ID="ID_401195519" CREATED="1505990993954" MODIFIED="1505991000243"/>
<node TEXT="IndexedDB" ID="ID_517179031" CREATED="1505991000586" MODIFIED="1505991006349"/>
</node>
</node>
</node>
</node>
</map>
