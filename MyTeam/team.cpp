#include <team.h>

Team::Team(QString name, QString coach, QString home, vector<Player> roster)
    :t_name(name), t_coach(coach), t_home(home), t_roster(roster)
{
}
Team::Team(QString name, QString coach, QString home)
    :t_name(name), t_coach(coach), t_home(home)
{
}

QString Team::name() const
{
    return t_name;
}
void Team::setName(const QString &name)
{
    if (name != t_name){
        t_name = name;
    }
}
QString Team::coach() const
{
    return t_coach;
}
void Team::setCoach(const QString &coach)
{
    if (coach != t_coach){
        t_coach = coach;
    }
}

QString Team::home() const
{
    return t_home;
}
void Team::setHome(const QString &home)
{
    if (home != t_home){
        t_home = home;
    }
}
void Team::addPlayer(const Player &n_player)
{
    Player new_pl = n_player;
    t_roster.push_back(new_pl);
}
int Team::removePLayer(Player &o_player)
{
    for (int i=0; i < t_roster.size(); i++){
       Player p = t_roster[i];
        if (o_player.equalsP(p.name(),p.surname(),p.birthday(),p.weight(),p.height())){
            t_roster.erase(t_roster.begin()+i);
            return 0;
        }
    }
    return 1;
}
vector<Player> Team::roster() const
{
 return t_roster;
}
void Team::setRoster(vector<Player> roster)
{
    t_roster = roster;
}

QString Team::rtostr()
{
    QString r;
    r = "";
    for (int i=0; i < t_roster.size(); i++)
    {
        Player p = t_roster[i];
        r+= p.name()+"  "+p.surname()+" "+p.birthday()+" "+p.weight()+" "+p.height()+" "+p.hometown()+" "+p.phone()+"\n";
    }
    return r;
}

