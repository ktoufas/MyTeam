#include "teammodel.h"



TeamModel::TeamModel(QObject *parent)
{
}

void TeamModel::addTeam(QString name, QString coach, QString home, vector<Player> roster)
{
    beginResetModel();
    Team *t;
    t = new Team(name,coach,home,roster);
    this->teamData.push_back(*t);
    endResetModel();
}
void TeamModel::deleteTeam(int teamIndex)
{
    beginResetModel();
    this->teamData.erase(teamData.begin()+teamIndex);
    endResetModel();
}

QHash<int, QByteArray> TeamModel::roleNames() const {
    QHash<int, QByteArray> roles;
    roles[this->NameRole] = "name";
    roles[this->CoachRole] = "coach";
    roles[this->HomeRole] = "home";
    roles[this->RosterRole] = "roster";

    return roles;
}

int TeamModel::rowCount(const QModelIndex &parent) const
{
    return teamData.size();
}
QVariant TeamModel::data(const QModelIndex &index, int role) const
{
    int row = index.row();
    if (teamData.size()>row && row>=0)
    {
        Team i = teamData[row];
        switch (role)
        {
        case NameRole: return i.name();
        case CoachRole: return i.coach();
        case HomeRole: return i.home();
        default: return QVariant();
        }
    }
    else
    {
        QVariant qv;
        return qv;
    }

}
