
abstract class AMain extends GunComponentType{
    IGameObject owner;
    int basefirerate;
    int basedamage;
    int basevelocity;

    int firerate;
    int damage;
    int velocity;

    int cooldown = 0;

    color col;

    AMain(){}

    void tick(){
        if(cooldown > 0){
            cooldown--;
        }
    }

    void fire(ArrayList<AAugment> augs, AAmmo ammo, PVector offset){}

    void resetStats(){
        firerate = basefirerate;
        damage = basedamage;
        velocity = basevelocity;
    }
}

class EmptyGun extends AMain{
    EmptyGun(IGameObject o){}
};

class MachineGun extends AMain{
    MachineGun(IGameObject o){
        name = "A Machine Gun";

        owner = o;
        basefirerate = 10;
        basedamage = 10;
        basevelocity = 8;
        resetStats();
        col = color(255, 255, 0);
    }

    void render() {
        fill(32);
        rect(0, -3, -8, 8);
        fill(0, 96, 0);
        rect(4, 6, -4, -8);
        fill(64);
        rect(2, 6, -2, 24);
        fill(32);
    }

    void fire(ArrayList<AAugment> augs, AAmmo ammo, PVector offset){
        if(cooldown == 0){
            for(AAugment a: augs){
                a.modify(this, offset, ammo);
            }
            ammo.make(owner, offset, damage, velocity, col);
            for(AAugment a: augs){
                a.active(this, offset, ammo);
            }
            cooldown = firerate;
            resetStats();
        }
    }
};

class RailGun extends AMain{
    // biribiri
    RailGun(IGameObject o){
        name = "A RailGun";

        owner = o;
        basefirerate = 30;
        basedamage = 40;
        basevelocity = 16;
        resetStats();
        col = color(255, 0, 0);
    }

    void render() {
        fill(32);
        rect(1, 6, 3, 28);
        rect(-1, 6, -3, 28);
        fill(255, 0, 0);
        rect(1, 6, -1, 26);
        fill(64);
        rect(4, -8, -4, 8);
        fill(0);
        ellipse(-4, -4, 4, 4);
        ellipse(-4, 0, 4, 4);
        ellipse(-4, 4, 4, 4);
    }

    void fire(ArrayList<AAugment> augs, AAmmo ammo, PVector offset){
        if(cooldown == 0){
            for(AAugment a: augs){
                a.modify(this, offset, ammo);
            }
            ammo.make(owner, offset, damage, velocity, col);
            for(AAugment a: augs){
                a.active(this, offset, ammo);
            }
            cooldown = firerate;
            resetStats();
        }
    }
};

