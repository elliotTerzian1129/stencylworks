package scripts;

import com.stencyl.graphics.G;
import com.stencyl.graphics.BitmapWrapper;

import com.stencyl.behavior.Script;
import com.stencyl.behavior.Script.*;
import com.stencyl.behavior.ActorScript;
import com.stencyl.behavior.SceneScript;
import com.stencyl.behavior.TimedTask;

import com.stencyl.models.Actor;
import com.stencyl.models.GameModel;
import com.stencyl.models.actor.Animation;
import com.stencyl.models.actor.ActorType;
import com.stencyl.models.actor.Collision;
import com.stencyl.models.actor.Group;
import com.stencyl.models.Scene;
import com.stencyl.models.Sound;
import com.stencyl.models.Region;
import com.stencyl.models.Font;
import com.stencyl.models.Joystick;

import com.stencyl.Engine;
import com.stencyl.Input;
import com.stencyl.Key;
import com.stencyl.utils.Utils;

import openfl.ui.Mouse;
import openfl.display.Graphics;
import openfl.display.BlendMode;
import openfl.display.BitmapData;
import openfl.display.Bitmap;
import openfl.events.Event;
import openfl.events.KeyboardEvent;
import openfl.events.TouchEvent;
import openfl.net.URLLoader;

import box2D.common.math.B2Vec2;
import box2D.dynamics.B2Body;
import box2D.dynamics.B2Fixture;
import box2D.dynamics.joints.B2Joint;
import box2D.collision.shapes.B2Shape;

import motion.Actuate;
import motion.easing.Back;
import motion.easing.Cubic;
import motion.easing.Elastic;
import motion.easing.Expo;
import motion.easing.Linear;
import motion.easing.Quad;
import motion.easing.Quart;
import motion.easing.Quint;
import motion.easing.Sine;

import com.stencyl.graphics.shaders.BasicShader;
import com.stencyl.graphics.shaders.GrayscaleShader;
import com.stencyl.graphics.shaders.SepiaShader;
import com.stencyl.graphics.shaders.InvertShader;
import com.stencyl.graphics.shaders.GrainShader;
import com.stencyl.graphics.shaders.ExternalShader;
import com.stencyl.graphics.shaders.InlineShader;
import com.stencyl.graphics.shaders.BlurShader;
import com.stencyl.graphics.shaders.SharpenShader;
import com.stencyl.graphics.shaders.ScanlineShader;
import com.stencyl.graphics.shaders.CSBShader;
import com.stencyl.graphics.shaders.HueShader;
import com.stencyl.graphics.shaders.TintShader;
import com.stencyl.graphics.shaders.BloomShader;



class SceneEvents_0 extends SceneScript
{
	public var _Points:Float;
	public var _Death:Float;
	
	/* ========================= Custom Event ========================= */
	public function _customEvent_PointUp():Void
	{
		Engine.engine.setGameAttribute("Points", (Engine.engine.getGameAttribute("Points") + 1));
	}
	
	
	public function new(dummy:Int, dummy2:Engine)
	{
		super();
		nameMap.set("Points", "_Points");
		_Points = 0.0;
		nameMap.set("Death", "_Death");
		_Death = 0.0;
		
	}
	
	override public function init()
	{
		
		/* ========================= When Drawing ========================= */
		addWhenDrawingListener(null, function(g:G, x:Float, y:Float, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled)
			{
				g.setFont(getFont(10));
				g.drawString("" + "Points", 26, 31);
				g.drawString("" + Engine.engine.getGameAttribute("Points"), 127, 31);
				if((_Death == 1))
				{
					g.setFont(getFont(11));
					g.drawString("" + "Game Over", 237, 232);
				}
			}
		});
		
		/* =========================== Any Key ============================ */
		addAnyKeyPressedListener(function(event:KeyboardEvent, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled)
			{
				Engine.engine.setGameAttribute("First Key Press", 0);
			}
		});
		
		/* ======================== When Updating ========================= */
		addWhenUpdatedListener(null, function(elapsedTime:Float, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled)
			{
				if((Engine.engine.getGameAttribute("pause_scene") == 1))
				{
					engine.pause();
					switchScene(GameModel.get().scenes.get(6).getID(), createBlindsOut(0.5, Utils.getColorRGB(0,0,0)), createBlindsIn(0.5, Utils.getColorRGB(0,0,0)));
					Engine.engine.setGameAttribute("pause_scene", 0);
				}
			}
		});
		
		/* =========================== Keyboard =========================== */
		addKeyStateListener("Enter", function(pressed:Bool, released:Bool, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled && pressed)
			{
				playSound(getSound(12));
			}
		});
		
		/* ======================== Actor of Type ========================= */
		addWhenTypeGroupKilledListener(getActorType(2), function(eventActor:Actor, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled)
			{
				_Death = asNumber(1);
				propertyChanged("_Death", _Death);
			}
		});
		
		/* ======================== Actor of Type ========================= */
		addActorEntersRegionListener(getRegion(2), function(a:Actor, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled && sameAsAny(getActorType(2),a.getType(),a.getGroup()))
			{
				stopAllSounds();
				runLater(1000 * 2, function(timeTask:TimedTask):Void
				{
					playSound(getSound(18));
					getActor(1).fadeTo(0, 2, Elastic.easeOut);
				}, null);
				switchScene(GameModel.get().scenes.get(1).getID(), createFadeOut(1, Utils.getColorRGB(0,0,0)), createFadeIn(1, Utils.getColorRGB(0,0,0)));
			}
		});
		
	}
	
	override public function forwardMessage(msg:String)
	{
		
	}
}