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
import scripts.Design_15_15_Pace;
import scripts.SceneEvents_2;
import scripts.ActorEvents_20;
import scripts.ActorEvents_22;
import scripts.ActorEvents_24;
import scripts.ActorEvents_26;
import scripts.SceneEvents_3;
import scripts.SceneEvents_4;
import scripts.SceneEvents_5;
import scripts.ActorEvents_28;
import scripts.ActorEvents_31;
import scripts.ActorEvents_34;
import scripts.ActorEvents_36;
import scripts.Design_28_28_AdvancedControls;
import scripts.ActorEvents_38;
import scripts.SceneEvents_6;
import scripts.ActorEvents_40;
import scripts.Design_32_32_KillTimer;


//Force all classes to compile since they aren't statically used.
class MyScripts
{
	var s:Script;
	var a:MyAssets;
	
	#if(mobile && !air)
	var stencylPreloader:scripts.StencylPreloader;
	#end
}