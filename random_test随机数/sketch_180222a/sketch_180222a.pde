int[] randomCounts;           

void setup() {
    size(640,350);
    randomCounts = new int[20];
}

void draw() {
    background(0);

    int index = int(random(randomCounts.length));      
    randomCounts[index]++;

    stroke(0,255,0);
    fill(0);
    int w = width/randomCounts.length;

    for (int x = 0; x < randomCounts.length; x++) {      
        rect(x*w,height-randomCounts[x],w-1,randomCounts[x]);
    } 
}