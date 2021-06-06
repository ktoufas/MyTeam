#ifndef MEDIATOR_H
#define MEDIATOR_H

#include <QObject>
#include <playermodel.h>
#include <teammodel.h>

class Mediator : public QObject
{
    Q_OBJECT
    Q_PROPERTY(PlayerModel* playerModel READ playerModel WRITE setPlayerModel NOTIFY playerModelChanged)
    Q_PROPERTY(TeamModel* teamModel READ teamModel WRITE setTeamModel NOTIFY teamModelChanged)

public:
    Mediator(QObject *parent=0);
    void setPlayerModel(PlayerModel* m)
    {
        _playerModel = m;
        emit playerModelChanged();
    }
    void setTeamModel(TeamModel* m)
    {
        _teamModel = m;
        emit teamModelChanged();
    }

    PlayerModel* playerModel()
    {
        return _playerModel;
    }
    TeamModel* teamModel()
    {
        return _teamModel;
    }

private:
    PlayerModel* _playerModel;
    TeamModel* _teamModel;

signals:
    void playerModelChanged();
    void teamModelChanged();
public slots:
    void insertPlayer(QString name, QString surname, QString birthday, QString weight, QString height, QString hometown, QString phone);
    void insertTeam(QString name, QString coach, QString home, QVariantList pNames, QVariantList pSurnames, QVariantList pBDays, QVariantList pWeights, QVariantList pHeights, QVariantList pHometowns, QVariantList pPhones);
    void setPlModel(QString teamName);
    void saveTeam(QString teamName);
    void deleteTeam(QString teamName);
    void deletePlayer(int playerIndex);
    void updatePlayer(int plIndex,QString name, QString surname, QString birthday, QString weight, QString height, QString hometown, QString phone);
    bool playerExists(QString name, QString sname, QString bday, QString weight,QString height);
    bool teamExists(QString name);
};

#endif // MEDIATOR_H
