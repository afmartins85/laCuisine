#ifndef ITEMMODEL_H
#define ITEMMODEL_H

#include <QObject>
#include <QImage>
#include <QUrl>
#include <QResource>

class ItemModel : public QObject
{
    Q_OBJECT

    Q_PROPERTY(QImage dishImage READ dishImage WRITE setDishImage NOTIFY dishImageChanged)
    Q_PROPERTY(QString name READ name WRITE setName NOTIFY nameChanged)
    Q_PROPERTY(QString description READ description WRITE setDescription NOTIFY descriptionChanged)
    Q_PROPERTY(float dishCost READ dishCost WRITE setDishCost NOTIFY dishCostChanged)

public:
    explicit ItemModel(QObject *parent = nullptr);
    //! Return the dish image
    QImage dishImage() const;
    //! Return the dish name
    QString name() const;
    //! Return the dish description
    QString description() const;
    //! Return the dish cost
    float dishCost() const;
    //! Return the list of itens
    Q_INVOKABLE QList<QObject *> getAllItens();
    //!Load hardcoded list
    Q_INVOKABLE void loadHardList();

public slots:
    //! Set image of the dish
    void setDishImage(QImage dishImage);
    //! Set name of the dish
    void setName(QString name);
    //! Set description of the dish
    void setDescription(QString description);
    //! Set cost of the dish
    void setDishCost(float dishCost);

signals:
    //! Signal for dish image changed
    void dishImageChanged(QImage dishImage);
    //! Signal for dish name changed
    void nameChanged(QString name);
    //! Signal for dish description changed
    void descriptionChanged(QString description);
    //! Signal for dish cost changed
    void dishCostChanged(float dishCost);

private:
    QImage m_dishImage;
    QString m_name;
    QString m_description;
    float m_dishCost;
    QList<QObject*> m_itemModel;
    QUrl url;
    QResource resource;
};

#endif // ITEMMODEL_H
