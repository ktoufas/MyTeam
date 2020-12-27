#ifndef PLAYERMODEL_H
#define PLAYERMODEL_H


#include <QObject>
#include <QAbstractListModel>
#include "player.h"

using namespace std;
class PlayerModel : public QAbstractListModel
{
    Q_OBJECT
public:
    enum PlayerRoles{
        SurnameRole = Qt::UserRole + 1,
        NameRole, BdayRole, WeightRole, HeightRole, HtownRole, PhoneRole
    };

    PlayerModel(QObject *parent = 0);
    int rowCount(const QModelIndex &parent = QModelIndex()) const;
    QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const;
    void addPlayer(QString name, QString surname, QString bday, QString weight,
                   QString height, QString hometown, QString phone);
    QHash<int, QByteArray> roleNames() const;
    void changeData(vector<Player> newPData);
    void deletePlayer(int playerIndex);
    void updatePlayer(int playerIndex, QString name, QString surname, QString bday, QString weight,
                     QString height, QString hometown, QString phone);
    vector<Player> playerData;
};

#endif // PLAYERMODEL_H
