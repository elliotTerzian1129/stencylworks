package scripts;

import com.stencyl.behavior.Script;
import scripts.SceneEvents_0;
import scripts.ActorEvents_2;
import scripts.ActorEvents_4;
import scripts.Design_3_3_FaceDirectionofMotion;
import scripts.Design_4_4_Follow;
import scripts.Design_6_6_Cheat1;
import scripts.ActorEvents_8;
import scripts.Design_8_8_PointUp;
import scripts.Design_9_9_Movement;
import scripts.Design_10_10_JumpandRunMovement;
import scripts.Design_11_11_KillCode;
import scripts.SceneEvents_1;
import scripts.ActorEvents_15;
import scripts.Design_15_15_Pace;


//Force all classes to compile since they aren't statically used.
class MyScripts
{
	var s:Script;
	var a:MyAssets;
	
	#if(mobile && !air)
	var stencylPreloader:scripts.StencylPreloader;
	#end
}