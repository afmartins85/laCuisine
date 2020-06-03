#include "itemmodel.h"

/**
 * @brief ItemModel::ItemModel
 * @param parent
 */
ItemModel::ItemModel(QObject *parent) : QObject(parent)
{

}

/**
 * @brief ItemModel::dishImage
 * @return
 */
QImage ItemModel::dishImage() const
{
    return m_dishImage;
}

/**
 * @brief ItemModel::name
 * @return
 */
QString ItemModel::name() const
{
    return m_name;
}

/**
 * @brief ItemModel::description
 * @return
 */
QString ItemModel::description() const
{
    return m_description;
}

/**
 * @brief ItemModel::dishCost
 * @return
 */
float ItemModel::dishCost() const
{
    return m_dishCost;
}

/**
 * @brief ItemModel::setDishImage
 * @param dishImage
 */
void ItemModel::setDishImage(QImage dishImage)
{
    if (m_dishImage == dishImage)
        return;

    m_dishImage = dishImage;
    emit dishImageChanged(m_dishImage);
}

/**
 * @brief ItemModel::setName
 * @param name
 */
void ItemModel::setName(QString name)
{
    if (m_name == name)
        return;

    m_name = name;
    emit nameChanged(m_name);
}

/**
 * @brief ItemModel::setDescription
 * @param description
 */
void ItemModel::setDescription(QString description)
{
    if (m_description == description)
        return;

    m_description = description;
    emit descriptionChanged(m_description);
}

/**
 * @brief ItemModel::setDishCost
 * @param dishCost
 */
void ItemModel::setDishCost(float dishCost)
{
    qWarning("Floating point comparison needs context sanity check");
    if (qFuzzyCompare(m_dishCost, dishCost))
        return;

    m_dishCost = dishCost;
    emit dishCostChanged(m_dishCost);
}

/**
 * @brief ItemModel::getAllItens
 * @return
 */
QList<QObject *> ItemModel::getAllItens()
{
    return m_itemModel;
}

/**
 * @brief ItemModel::loadHardList
 */
void ItemModel::loadHardList()
{
    ItemModel *firstItem = new ItemModel;
    firstItem->setDishImage(QImage("qrc:/images/foto_produtos_menu.png"));
    firstItem->setName("Salada Verde");
    firstItem->setDescription("Cogumelos, ervilhas, molho de coalhada seca\n e tomates verdes.");
    firstItem->setDishCost(15.99);
    m_itemModel.append(firstItem);
}
