#include "playermodel.h"

PlayerModel::PlayerModel(QObject *parent)
{
}

void PlayerModel::addPlayer(QString name, QString surname, QString bday, QString weight, QString height, QString hometown, QString phone)
{
    beginResetModel();
    Player *p;
    p = new Player(name,surname,bday,weight,height,hometown,phone);
    this->playerData.push_back(*p);
    endResetModel();
}
void PlayerModel::updatePlayer(int playerIndex, QString name, QString surname, QString bday, QString weight, QString height, QString hometown, QString phone){
    this->playerData[playerIndex].setName(name);
    this->playerData[playerIndex].setSurname(surname);
    this->playerData[playerIndex].setBirthday(bday);
    this->playerData[playerIndex].setWeight(weight);
    this->playerData[playerIndex].setHeight(height);
    this->playerData[playerIndex].setHometown(hometown);
    this->playerData[playerIndex].setPhone(phone);

}

void PlayerModel::deletePlayer(int playerIndex)
{
    beginResetModel();
    this->playerData.erase(playerData.begin()+playerIndex);
    endResetModel();
}

void PlayerModel::changeData(vector<Player> newPData)
{
    beginResetModel();
    this->playerData = newPData;
    endResetModel();
}

int PlayerModel::rowCount(const QModelIndex &parent) const
{
    return playerData.size();
}
QVariant PlayerModel::data(const QModelIndex &index, int role) const
{
    int row  = index.row();
    if(playerData.size()>row && row>=0)
    {
        Player p = playerData[row];
        switch (role)
        {
        case SurnameRole: return p.surname();
        case NameRole: return p.name();
        case BdayRole: return p.birthday();
        case HeightRole: return p.height();
        case WeightRole: return p.weight();
        case HtownRole: return p.hometown();
        case PhoneRole: return p.phone();
        default: return QVariant();
        }
    }
    else
    {
        QVariant qv;
        return qv;
    }
}


QHash<int, QByteArray> PlayerModel::roleNames() const {
    QHash<int, QByteArray> roles;
    roles[this->SurnameRole] = "surname";
    roles[this->NameRole] = "name";
    roles[this->BdayRole] = "birthday";
    roles[this->WeightRole] = "weight";
    roles[this->HeightRole] = "plHeight";
    roles[this->HtownRole] = "hometown";
    roles[this->PhoneRole] = "telephone";
    return roles;
}
