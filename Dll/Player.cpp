#include "Player.h"

using namespace godot;

void Player::_register_methods()
{
	register_method((char*)"_ready", &Player::_ready);
	register_method((char*)"_physics_process", &Player::_physics_process);
	//register_method((char*)"_process", &Player::_physics_process);
}


Player::Player(){
	vec = Vector2::ZERO;
	input = Input::get_singleton();
}
Player::~Player(){

}
void Player::_init(){}

void Player::_ready() {
	sprite = (AnimatedSprite*)get_node("Sprite");
	coll = (CollisionShape2D*)get_node("Collision");
	iswall = (RayCast2D*)get_node("iswall");
}

void Player::_physics_process(float delta) {
	input = Input::get_singleton();
	vec.x = 0;
	if (isclimbing) vec.y = 0;
	climb();
	move();
	jump();
	test_state();
	vec.x *= MAXSPEED * delta;
	vec.y += _gravity * delta;
	anim();
	vec = move_and_slide_with_snap(vec, Vector2::DOWN, Vector2::UP, true);
}


void Player::climb()
{
	if (!iswall->is_colliding())  isclimbing = false; 
	if (iswall->is_colliding() && input->is_action_just_pressed("e")) isclimbing = true;
}
void Player::anim()
{
	switch (player_state)
	{
	case godot::Player::IDLE:
		sprite->play("idle");
		break;
	case godot::Player::RUN:
		sprite->play("run");
		break;
	case godot::Player::JUMP:
		break;
	case godot::Player::DOWN:
		break;
	case godot::Player::ROLL:
		break;
	default:
		break;
	}
}
void Player::move() {
	if (input->is_action_pressed("a")) {
		vec.x -= 1;
		sprite->set_flip_h(true);
		iswall->set_rotation_degrees(-90);
	}
	else if (input->is_action_pressed("d")) {
		vec.x += 1;
		sprite->set_flip_h(false);
		iswall->set_rotation_degrees(90);
	}
}
void Player::jump() {
	if (!input->is_action_just_pressed("space")) return;
	if (this->is_on_floor()) vec.y -= _jump;
	else if (isclimbing) {
		isclimbing = false;
		vec.y -= _jump;
	}
}
void Player::test_state() {
	if (vec.y < -1.0) player_state = JUMP;
	else if (vec.y > 1.0) player_state = DOWN;
	else if (vec.x != 0) player_state = RUN;
	else player_state = IDLE;
}