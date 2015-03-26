class Player{

    String name;
    int score;
    String [] list;
    void save(){
    list[0] = name;
    list[1] = Integer.toString(score);
    saveStrings("leaderboard.txt", list);
    }



}
