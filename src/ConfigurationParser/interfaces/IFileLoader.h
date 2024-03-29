#ifndef IFILELOADER_H
#define IFILELOADER_H

#include <iostream>

class QDomDocument;

class IFileLoader
{
public:
    virtual ~IFileLoader() = default;
    virtual QDomDocument LoadFile(const std::string& filePath) = 0;
    //virtual mat_t LoadFile(std::string& filePath) = 0;
};

#endif // IFILELOADER_H
