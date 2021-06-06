#ifndef TEAM_H
#define TEAM_H


#include <QString>
#include <playermodel.h>
#include <player.h>
using namespace std;
class Team
{
private:
    QString t_name;
    QString t_coach;
    QString t_home;
    vector<Player> t_roster;

public:
    Team(QString name, QString coach, QString home, vector<Player> roster);
    Team(QString name, QString coach, QString home);
    QString name() const;
    void setName(const QString &name);
    QString coach() const;
    void setCoach(const QString &coach);
    QString home() const;
    void setHome(const QString &home);
    vector<Player> roster() const;
    void setRoster(vector<Player> roster);
    void addPlayer(const Player &n_player);
    int removePLayer(Player &o_player);
    QString rtostr();


};
#endif // TEAM_H
