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



class Design_9_9_Movement extends ActorScript
{
	public var _WalkSpeed:Float;
	public var _WalkSpeedY:Float;
	public var _Jump:Float;
	public var _DoublrJump:Float;
	
	
	public function new(dummy:Int, actor:Actor, dummy2:Engine)
	{
		super(actor);
		nameMap.set("Actor", "actor");
		nameMap.set("Walk Speed X", "_WalkSpeed");
		_WalkSpeed = 0.0;
		nameMap.set("Walk Speed Y", "_WalkSpeedY");
		_WalkSpeedY = 0.0;
		nameMap.set("Jump", "_Jump");
		_Jump = 0.0;
		nameMap.set("Doublr Jump", "_DoublrJump");
		_DoublrJump = 0;
		
	}
	
	override public function init()
	{
		
		/* ======================== When Updating ========================= */
		addWhenUpdatedListener(null, function(elapsedTime:Float, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled)
			{
				if((_WalkSpeed == 1))
				{
					actor.setXVelocity(10);
				}
				else if((_WalkSpeed == 2))
				{
					actor.setXVelocity(-10);
				}
				else if((_WalkSpeedY == 1))
				{
					actor.setYVelocity(10);
				}
				else if((_WalkSpeedY == 2))
				{
					if((_Jump == 0))
					{
						actor.setYVelocity(-30);
						_Jump = asNumber(1);
						propertyChanged("_Jump", _Jump);
						if(isKeyReleased("Up"))
						{
							if(isKeyPressed("Up"))
							{
								if((_DoublrJump == 0))
								{
									_DoublrJump = asNumber(1);
									propertyChanged("_DoublrJump", _DoublrJump);
								}
								runLater(1000 * 2, function(timeTask:TimedTask):Void
								{
									actor.pushInDirection(180, 10);
								}, actor);
								runLater(1000 * 0.75, function(timeTask:TimedTask):Void
								{
									_Jump = asNumber(0);
									propertyChanged("_Jump", _Jump);
									_DoublrJump = asNumber(0);
									propertyChanged("_DoublrJump", _DoublrJump);
								}, actor);
							}
						}
						runLater(1000 * 1.5, function(timeTask:TimedTask):Void
						{
							actor.pushInDirection(180, 10);
						}, actor);
						runLater(1000 * 0.75, function(timeTask:TimedTask):Void
						{
							_Jump = asNumber(0);
							propertyChanged("_Jump", _Jump);
							_DoublrJump = asNumber(0);
							propertyChanged("_DoublrJump", _DoublrJump);
						}, actor);
					}
				}
				else
				{
					_WalkSpeed = asNumber(0);
					propertyChanged("_WalkSpeed", _WalkSpeed);
					_WalkSpeedY = asNumber(0);
					propertyChanged("_WalkSpeedY", _WalkSpeedY);
				}
			}
		});
		
		/* ======================== When Updating ========================= */
		addWhenUpdatedListener(null, function(elapsedTime:Float, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled)
			{
				if(isKeyDown("Right"))
				{
					_WalkSpeed = asNumber(1);
					propertyChanged("_WalkSpeed", _WalkSpeed);
				}
				else if(isKeyDown("Left"))
				{
					_WalkSpeed = asNumber(2);
					propertyChanged("_WalkSpeed", _WalkSpeed);
				}
				else if(isKeyDown("Down"))
				{
					_WalkSpeedY = asNumber(1);
					propertyChanged("_WalkSpeedY", _WalkSpeedY);
				}
				else if(isKeyDown("Up"))
				{
					_WalkSpeedY = asNumber(2);
					propertyChanged("_WalkSpeedY", _WalkSpeedY);
				}
				else
				{
					_WalkSpeedY = asNumber(0);
					propertyChanged("_WalkSpeedY", _WalkSpeedY);
					_WalkSpeed = asNumber(0);
					propertyChanged("_WalkSpeed", _WalkSpeed);
					actor.pushInDirection(180, 5);
				}
			}
		});
		
	}
	
	override public function forwardMessage(msg:String)
	{
		
	}
}