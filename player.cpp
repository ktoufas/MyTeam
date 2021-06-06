#include "player.h"

Player::Player(const QString &name, const QString &surname,
               const QString &birthday, const QString &weight,
               const QString &height, const QString &hometown,
               const QString &phone)
    : p_name(name), p_surname(surname), p_birthday(birthday), p_weight(weight), p_height(height),p_hometown(hometown), p_phone(phone)
{
}

Player::Player(const QString &name, const QString &surname)

    :p_name(name), p_surname(surname)
{
}

QString Player::name() const
{
    return p_name;
}

void Player::setName(const QString &name)
{
    if (name != p_name){
        p_name = name;
    }
}

QString Player::surname() const
{
    return p_surname;
}

void Player::setSurname(const QString &surname)
{
    if (surname != p_surname){
        p_surname = surname;
    }
}
QString Player::birthday() const
{
    return p_birthday;
}
void Player::setBirthday(const QString &birthday)
{
    if (birthday != p_birthday){
        p_birthday = birthday;
    }
}

QString Player::weight() const
{
    return p_weight;
}

void Player::setWeight(const QString &weight)
{
    if (weight != p_weight){
        p_weight = weight;
    }
}

QString Player::height() const
{
    return p_height;
}

void Player::setHeight(const QString &height)
{
    if (height != p_height){
        p_height = height;
    }
}

QString Player::hometown() const
{
    return p_hometown;
}
void Player::setHometown(const QString &hometown)
{
    if (hometown != p_hometown){
        p_hometown = hometown;
    }
}

QString Player::phone() const
{
    return p_phone;
}
void Player::setPhone(const QString &phone)
{
    if (phone != p_phone){
        p_phone = phone;
    }
}
QString Player::pToQS() const
{

    QString s =  p_name+"|"+p_surname+"|"+p_birthday+"|"+p_weight+"|"+p_height+"|"+p_hometown+"|"+p_phone+"\n";
    return s;
}

bool Player::equalsP(QString name, QString surname, QString birthday, QString weight, QString height)
{
    if(name == p_name && surname == p_surname && birthday == p_birthday && height == p_height && weight == p_weight){
        return true;
    }
    return false;
}

