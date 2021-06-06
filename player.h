#ifndef PLAYER_H
#define PLAYER_H


#include <QString>
using namespace std;
class Player
{
private:
    QString p_name;
    QString p_surname;
    QString p_birthday;
    QString p_weight;
    QString p_height;
    QString p_hometown;
    QString p_phone;

public:
    Player(const QString &name, const QString &surname, const QString &bday, const QString &weight,
    const QString &height, const QString &hometown,const QString &phone);
    Player(const QString &name, const QString &surname);
    QString name() const;
    void setName(const QString &name);
    QString surname() const;
    void setSurname(const QString &surname);
    QString birthday() const;
    void setBirthday(const QString &birthday);
    QString weight() const;
    void setWeight(const QString &weight);
    QString height() const;
    void setHeight(const QString &Height);
    QString hometown() const;
    void setHometown(const QString &hometown);
    QString phone() const;
    void setPhone(const QString &phone);
    QString pToQS() const;
    bool equalsP(QString name, QString surname, QString birthday, QString weight, QString height);

};
#endif // PLAYER_H
