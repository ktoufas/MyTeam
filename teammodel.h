#ifndef TEAMMODEL_H
#define TEAMMODEL_H

#include <QObject>
#include <QAbstractListModel>
#include "team.h"
using namespace std;

class TeamModel : public QAbstractListModel
{
    Q_OBJECT
public:
    enum TeamRoles{
        NameRole = Qt::UserRole + 1,
        CoachRole, HomeRole, RosterRole
    };
    TeamModel(QObject *parent = 0);
    void addTeam(QString name, QString coach, QString home, vector<Player> roster);
    int rowCount(const QModelIndex &parent = QModelIndex()) const;
    QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const;
    QHash<int, QByteArray> roleNames() const;
    void deleteTeam(int teamIndex);
    vector<Team> teamData;

};

#endif // TEAMMODEL_H
