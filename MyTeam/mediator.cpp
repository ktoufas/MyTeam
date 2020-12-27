
#include "mediator.h"
#include <QAbstractListModel>
#include <QFile>
#include <QStandardPaths>
#include <QTextStream>
#include <QDir>
using namespace std;
Mediator::Mediator(QObject *parent) : QObject(parent)
{
    _teamModel = new TeamModel();
    _playerModel = new PlayerModel();
    QDir _dir;
    if( !_dir.exists("teamsData"))
    {
        _dir.mkdir("teamsData");
    }

    //Load DATA
    QString tlist = "teamsData\\teamsList.dat";
    QFile lqf(tlist);
    lqf.open(QIODevice::ReadOnly | QIODevice::Text);
    QTextStream lin(&lqf);
    while(!lin.atEnd())
    {

        QString tFName = lin.readLine(); //Diavasame onoma omadas
        QString tfile = "teamsData\\"+tFName+".dat";
        QFile qf(tfile);
        qf.open(QIODevice::ReadOnly | QIODevice::Text);
        QTextStream in(&qf);
        QString teamName = in.readLine();
        QString teamCoach = in.readLine();
        QString teamHome = in.readLine();
        vector<Player> teamRoster;
        while(!in.atEnd())
        {
         QString playerline = in.readLine();
         QStringList tokens = playerline.split('|');
         Player *p = new Player(tokens[0],tokens[1],tokens[2],tokens[3],tokens[4],tokens[5],tokens[6]);
         teamRoster.push_back(*p);
        }
        _teamModel->addTeam(teamName,teamCoach,teamHome,teamRoster);

    }

}
/////////////////////////////////////


/////////////////////////////////////
void Mediator::deletePlayer(int playerIndex)
{
    _playerModel->deletePlayer(playerIndex);
    emit playerModelChanged();
}

void Mediator::updatePlayer(int plIndex,QString name, QString surname, QString birthday, QString weight, QString height, QString hometown, QString phone)
 {
        _playerModel->updatePlayer(plIndex,name,surname,birthday,weight, height,hometown, phone);
        emit playerModelChanged();
 }

void Mediator::insertPlayer(QString name, QString surname, QString birthday, QString weight, QString height, QString hometown, QString phone)
{
    _playerModel->addPlayer(name,surname,birthday,weight,height,hometown,phone);
    emit playerModelChanged();
}
void Mediator::insertTeam(QString name, QString coach, QString home, QVariantList pNames, QVariantList pSurnames, QVariantList pBDays, QVariantList pWeights, QVariantList pHeights, QVariantList pHometowns, QVariantList pPhones)
{
    vector<Player> roster;
    Player *p;
    for(int i=0;i<pNames.size();i++)
    {
        p = new Player(pNames[i].toString(),pSurnames[i].toString(),pBDays[i].toString(),pWeights[i].toString(),pHeights[i].toString(),pHometowns[i].toString(),pPhones[i].toString());
        roster.push_back(*p);
    }

    _teamModel->addTeam(name,coach,home,roster);
    //Write the team to teamsList
    QString tl = "teamsData\\teamsList.dat";
    QFile qftl(tl);
    QTextStream outln(&qftl);
    qftl.open(QIODevice::Append | QIODevice::Text);
    outln<<name<<endl;
    qftl.close();

    //Save the team
    QString s = "teamsData\\"+name+".dat";
    QFile qf(s);
    QTextStream out(&qf);
    qf.open(QIODevice::Append | QIODevice::Text);
    out<<name<<endl;
    out<<coach<<endl;
    out<<home<<endl;
    for(int i=0; i<roster.size();i++)
    {
        out<<roster[i].pToQS();
    }
    qf.close();


}

bool Mediator::playerExists(QString name, QString sname, QString bday, QString weight,QString height)
{
    for(int i=0; i< _playerModel->playerData.size();i++)
    {
        if(_playerModel->playerData[i].equalsP(name,sname,bday,weight,height))
            return true;
    }
    return false;
}



bool Mediator::teamExists(QString name)
{
    int modelS = _teamModel->rowCount();
    for(int i=0;i<modelS;i++)
    {
        if (_teamModel->teamData[i].name()==name)
        {
            return true;
        }
    }
    return false;
}
void Mediator::deleteTeam(QString teamName)
{
    vector<QString> lines;
    int teamIndex;
    QString tlist = "teamsData\\teamsList.dat";
    QFile lqf(tlist);
    lqf.open(QIODevice::WriteOnly | QIODevice::Text);
    QTextStream lout(&lqf);
    for(int i=0;i<_teamModel->rowCount();i++)
    {

        QString teamdataname = _teamModel->teamData[i].name();
        if(teamdataname==teamName)
        {
           teamIndex = i;
        }
        else
        {
            lout<<_teamModel->teamData[i].name()<<endl;
        }
    }
    lqf.close();
    QString fname = "teamsData\\"+teamName+".dat";
    remove(fname.toStdString().c_str());
        _teamModel->deleteTeam(teamIndex);
        emit teamModelChanged();


}

void Mediator::saveTeam(QString teamName)
{
    for(int i=0;i<_teamModel->rowCount();i++)
    {

        QString teamdataname = _teamModel->teamData[i].name();
        if(teamdataname==teamName)
        {
            _teamModel->teamData[i].setRoster(_playerModel->playerData);
            QString s = "teamsData\\"+teamName+".dat";
            QFile qf(s);
            QTextStream out(&qf);
            qf.open(QIODevice::WriteOnly | QIODevice::Text);
            out<<_teamModel->teamData[i].name()<<endl;
            out<<_teamModel->teamData[i].coach()<<endl;
            out<<_teamModel->teamData[i].home()<<endl;
            vector<Player> teamRoster = _teamModel->teamData[i].roster();
            for(int i=0; i<teamRoster.size();i++)
            {
                out<<teamRoster[i].pToQS();
            }
            qf.close();

        }
    }
}

void Mediator::setPlModel(QString teamName)
{


    for(int i=0;i<_teamModel->rowCount();i++)
    {

        QString teamdataname = _teamModel->teamData[i].name();
        if(teamdataname==teamName)
        {
            _playerModel->changeData(_teamModel->teamData[i].roster());
            emit playerModelChanged();
        }
    }
}
