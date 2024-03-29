#ifndef ILEXER_H
#define ILEXER_H

#include <string>
#include <vector>

class QDomDocument;

class ILexer
{
public:
    virtual ~ILexer() = default;
    virtual std::pair<std::vector<std::string>, QDomDocument> Tokenize(const std::vector<char>& fileData) = 0;
};

#endif // ILEXER_H
