#pragma once
#include <Godot.hpp>
#include <KinematicBody2D.hpp>
#include <AnimatedSprite.hpp>
#include <CollisionShape2D.hpp>
#include <RayCast2D.hpp>
#include <Input.hpp>

namespace godot {
	class Player : public KinematicBody2D {
	private:
		GODOT_CLASS(Player, KinematicBody2D)
	public:
		static void _register_methods();
		void _init();
		void _ready();
		void _physics_process(float delta);
		Player() ;
		~Player() ;
		
	public:
		const float MAXSPEED = 5000.f;
		float _jump = 200.f;
		float _gravity = 300.f;
	private:
		Vector2 vec;
		Input* input;

		AnimatedSprite* sprite ;
		CollisionShape2D* coll ;
		RayCast2D* iswall ;
	public:
		bool isclimbing = false;
		enum STATE
		{
			IDLE,RUN,JUMP,DOWN,ROLL
		};
		STATE player_state = IDLE;
	public:
		void climb();
		void anim();
		void move();
		void jump();
		void test_state();
	};

}