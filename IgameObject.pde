
abstract class IGameObject{

    PVector pos, last;
    float dir = 0;

    int team = 0;

    float size;

    void tick(){}
    void render(){}

    void move(float friction){

        PVector temp = new PVector(pos.x-last.x, pos.y-last.y);

        dir %= 2*PI;
        
        temp.mult(friction);
        last.set(pos);
        pos.add(temp);

        temp = new PVector(pos.x-last.x, pos.y-last.y);
        if(pos.x < 0){
            pos.x = 0;
            last.x = temp.x;
            dir = -dir;
        } else if(pos.x > width) {
            pos.x = width;
            last.x = width+temp.x;
            dir = -dir;
        }

        if(pos.y < 0){
            pos.y = 0;
            last.y = temp.y;
            dir = -PI-dir;
        } else if(pos.y > height){
            pos.y = height;
            last.y = height+temp.y;
            dir = -PI-dir;
        }

    }

    void collide(IGameObject o){}
}

