extends Node

export (PackedScene) var Mob
var score

func _ready():
	randomize()

	

func new_game():
	score = 0
	$Player.start($StartPosition.position)
	$ScoreTimer.start()
	$HUD.show_message("Get Ready")
	$HUD.update_score(score)
	$StartTimer.start()
	$Music.play()
	print("hi")
	

func game_over():
	$ScoreTimer.stop()
	$MobTimer.stop()
	$HUD.game_over()
	$DeathSound.play()
	$Music.stop()
	print("pee")


func _on_StartTimer_timeout():
	print("poo")
	$ScoreTimer.start()
	$MobTimer.start()

func _on_ScoreTimer_timeout():
	score += 1
	$HUD.update_score(score)


func _on_MobTimer_timeout():
	print("yo")
	$Mob/MobPath.set_offset(randi())
	var mob = Mob.instance()
	add_child(mob)
	var direction = $Mob/MobPath.rotation + PI / 2
	mob.position = $Mob/MobPath.position
	direction += rand_range(-PI/4, PI/4)
	mob.rotation = direction
	mob.set_linear_velocity(Vector2(rand_range(mob.MIN_SPEED, mob.MAX_SPEED), 0).rotated(direction))
